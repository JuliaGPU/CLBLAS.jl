import CLBLAS
import OpenCL

using PyCall

const kernel_source = "
__kernel void mmul(
        const int Mdim,
        const int Ndim,
        const int Pdim,
        __global float* A,
        __global float* B,
        __global float* C)
{
        int k;
        int i = get_global_id(0);
        int j = get_global_id(1);
        float tmp;
        if ((i < Ndim) && (j < Mdim))
        {
                tmp = 0.0f;
                for (k = 0; k < Pdim; k++)
                        tmp += A[i*Ndim+k] * B[k*Pdim+j];
                C[i*Ndim+j] = tmp;
        }
}
"

const kernel_source1 = "
#define BLOCK_SIZE 16
#define AS(i, j) As[j + i * BLOCK_SIZE]
#define BS(i, j) Bs[j + i * BLOCK_SIZE]

///////////////////////////////////////////////////////////////////////////////
//! Matrix multiplication on the device: C = A * B
//! uiWA is A's width and uiWB is B's width
////////////////////////////////////////////////////////////////////////////////
__kernel void
  ommul(int uiWA, int uiWB, int uiWC,
             __global float* C, __global float* A, __global float* B,
             __local float* As, __local float* Bs)
{
  // Block index
  int bx = get_group_id(0);
  int by = get_group_id(1);

  // Thread index
  int tx = get_local_id(0);
  int ty = get_local_id(1);

  // Index of the first sub-matrix of A processed by the block
  int aBegin = uiWA * BLOCK_SIZE * by;

  // Index of the last sub-matrix of A processed by the block
  int aEnd   = aBegin + uiWA - 1;

  // Step size used to iterate through the sub-matrices of A
  int aStep  = BLOCK_SIZE;

  // Index of the first sub-matrix of B processed by the block
  int bBegin = BLOCK_SIZE * bx;

  // Step size used to iterate through the sub-matrices of B
  int bStep  = BLOCK_SIZE * uiWB;

  // Csub is used to store the element of the block sub-matrix
  // that is computed by the thread
  float Csub = 0.0f;

  // Loop over all the sub-matrices of A and B
  // required to compute the block sub-matrix
  for (int a = aBegin, b = bBegin;
       a <= aEnd;
       a += aStep, b += bStep) {

    // Load the matrices from device memory
    // to shared memory; each thread loads
    // one element of each matrix
    AS(ty, tx) = A[a + uiWA * ty + tx];
    BS(ty, tx) = B[b + uiWB * ty + tx];

    // Synchronize to make sure the matrices are loaded
    barrier(CLK_LOCAL_MEM_FENCE);

    // Multiply the two matrices together;
    // each thread computes one element
    // of the block sub-matrix
        #pragma unroll
    for (int k = 0; k < BLOCK_SIZE; ++k)
      Csub += AS(ty, k) * BS(k, tx);

    // Synchronize to make sure that the preceding
    // computation is done before loading two new
    // sub-matrices of A and B in the next iteration
    barrier(CLK_LOCAL_MEM_FENCE);
  }

  // Write the block sub-matrix to device memory;
  // each thread writes one element
  C[get_global_id(1) * get_global_size(0) + get_global_id(0)] = Csub;
}
"


function generateAlmostSqRandomMatrixSize(num::Int)
   # Format is (m,k,n) so matrix mul is (m,n)
   matSizes = Array(Tuple, num)
   for i in 1:num
      matSizes[i] = (rand(1:100) * 16, rand(1:100) * 16, rand(1:100) * 16)
   end
   return matSizes
end

function runTimes(num::Int, device=nothing, context=nothing, queue=nothing, mmul=nothing, ommul=nothing  )
        if(device == nothing)
            device, context, queue = clblas.get_next_compute_context()
        end

        alpha = float32(5)
        beta  = float32(2)

        matSizes = generateAlmostSqRandomMatrixSize(num)

        cpuTimes = Array(Int, num)
        data = nothing
        for i in 1:num

           A = rand(Float32, matSizes[i][1], matSizes[i][2])
           B = rand(Float32, matSizes[i][2], matSizes[i][3])
           C = rand(Float32, matSizes[i][1], matSizes[i][3])

           startT = time_ns()
           data = (alpha*A*B) + (beta*C)
           endT = time_ns()
           cpuTimes[i] = endT - startT
           gc()
        end

        gpuMmulTimes2 = zeros(Int, num)
        gpuTimes = Array(Int, num)
        for i in 1:num

           A = clblas.randBuf(matSizes[i][1], matSizes[i][2]; ctx=context, queue=queue)
           cl.api.clWaitForEvents(cl.cl_uint(1), pointer(A.event))
           B = clblas.randBuf(matSizes[i][2], matSizes[i][3]; ctx=context, queue=queue)
           cl.api.clWaitForEvents(cl.cl_uint(1), pointer(B.event))
           C = clblas.randBuf(matSizes[i][1], matSizes[i][3]; ctx=context, queue=queue)
           cl.api.clWaitForEvents(cl.cl_uint(1), pointer(C.event))

           startT = time_ns()
           future = clblas.clblasSgemm(uint32(0), uint32(0), alpha, A, B, beta, C)
           cl.api.clWaitForEvents(cl.cl_uint(1), pointer(future.event))
           endT = time_ns()
           gpuTimes[i] = endT - startT
           gc()

           if(ommul != nothing)
              m = matSizes[i][1]
              k = matSizes[i][2]
              n = matSizes[i][3]

              blocksize = 16
              localmem1 = cl.LocalMem(Float32, blocksize^2)
              localmem2 = cl.LocalMem(Float32, blocksize^2)


              startT = time_ns()
              evt = ommul[queue, (m,), (16,)](n, m, k, A.mem, B.mem, C.mem, localmem1, localmem2)
              cl.api.clWaitForEvents(cl.cl_uint(1), pointer([pointer(evt)]))
              endT = time_ns()
              gpuMmulTimes2[i] = endT - startT
              gc()
           end
        end


         gpuMmulTimes = zeros(Int, num)
#        if(mmul != nothing)
#            for i in 1:num
#                startT = time_ns()
#                m = matSizes[i][1]
#                k = matSizes[i][2]
#                n = matSizes[i][3]
#                A = clblas.randBuf(m, k; ctx=context, queue=queue)
#                cl.api.clWaitForEvents(cl.cl_uint(1), pointer(A.event))
#                B = clblas.randBuf(k, n; ctx=context, queue=queue)
#                cl.api.clWaitForEvents(cl.cl_uint(1), pointer(B.event))
#                C = clblas.randBuf(m, n; ctx=context, queue=queue)
#                cl.api.clWaitForEvents(cl.cl_uint(1), pointer(C.event))

#                global_range = (m, n)
#                evt = mmul[queue, global_range](n, m, k, A.mem, B.mem, C.mem)
#                cl.api.clWaitForEvents(cl.cl_uint(1), pointer([pointer(evt)]))
#                endT = time_ns()
#                gpuMmulTimes[i] = endT - startT
#                gc()
#             end
#        end
     return (cpuTimes, gpuTimes, gpuMmulTimes, gpuMmulTimes2)
end

const clblas = CLBLAS
clblas.setup(true)
const cl = OpenCL

for platform in cl.platforms()
    if platform[:name] == "Portable Computing Language"
        warn("Portable Computing Language platform not yet supported")
        continue
    end

    for device in cl.devices(platform)
        @printf("====================================================\n")
        @printf("Platform name:    %s\n",  platform[:name])
        @printf("Platform profile: %s\n",  platform[:profile])
        @printf("Platform vendor:  %s\n",  platform[:vendor])
        @printf("Platform version: %s\n",  platform[:version])
        @printf("----------------------------------------------------\n")
        @printf("Device name: %s\n", device[:name])
        @printf("Device type: %s\n", device[:device_type])
        @printf("Device mem: %i MB\n",           device[:global_mem_size] / 1024^2)
        @printf("Device max mem alloc: %i MB\n", device[:max_mem_alloc_size] / 1024^2)
        @printf("Device max clock freq: %i MHZ\n",  device[:max_clock_frequency])
        @printf("Device max compute units: %i\n",   device[:max_compute_units])
        @printf("Device max work group size: %i\n", device[:max_work_group_size])
        @printf("Device max work item size: %s\n",  device[:max_work_item_size])

   end
end

device, context, queue = clblas.get_next_compute_context()
#Prepare Kernel to Run Matrix Mul
info("Building The Kernel")
prg  = cl.Program(context, source=kernel_source) |> cl.build!
mmul = cl.Kernel(prg, "mmul")
info("Kernel is ready")

prg1  = cl.Program(context, source=kernel_source1) |> cl.build!
ommul = cl.Kernel(prg1, "ommul")
info("Kernel-2 is ready")

runTimes(5, device, context, queue, mmul, ommul)

#print("Debug is ready!")
#readline()

num = int(ARGS[1])
cpuTimes, gpuTimes, gpuMmulTimes, gpuMmulTimes2 = runTimes(num, device, context, queue, mmul, ommul)

println("Average CPU    :", sum(cpuTimes)/num)
println("Average GPU    :", sum(gpuTimes)/num)
println("Average GPU-Mul:", sum(gpuMmulTimes)/num)
println("Average GPU-Mul2:", sum(gpuMmulTimes2)/num)
clblas.teardown()

sleep(1)

@pyimport matplotlib.pyplot as plt
plt.plot([1:num], gpuMmulTimes2, color="green", linewidth=2.0, linestyle="--", label="GPU-Mul2")
plt.plot([1:num], cpuTimes, color="red", linewidth=2.0, linestyle="--", label="CPU")
plt.plot([1:num], gpuTimes, color="blue", linewidth=2.0, linestyle="--", label="GPU")
#plt.plot([1:num], gpuMmulTimes, color="yellow", linewidth=2.0, linestyle="--", label="GPU-Mul")

plt.ylabel("time ns")
plt.title("CPU vs GPU times")
plt.show()


function gemm(m, k, n, alpha, beta,  times)
      total = 0
      for i in 1:times
         A = rand(Float32, m, k)
         B = rand(Float32, k, n)
         C = rand(Float32, m, n)
         tic()
         C = alpha*A*B + beta*C
         total += toq()
      end
      (total / times) * 10 ^ 9
end

