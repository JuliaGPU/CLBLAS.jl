import CLBLAS
import OpenCL.cl

const clblas = CLBLAS

const COUNT = int(ARGS[1])

function seq_mat_mul_sdot{T}(Mdim::Int, Ndim::Int, Pdim::Int,
                             A::Array{T}, B::Array{T}, C::Array{T})
    for i in 1:Ndim
        for j in 1:Mdim
            tmp = zero(Float32)
            for k in 1:Pdim
                @inbounds tmp += A[(i-1)*Ndim+k] * B[(k-1)*Pdim+j]
            end
            @inbounds C[(i-1)*Ndim+j] = tmp
        end
    end
end

A = rand(Float32, 10, 10)
B = rand(Float32, 10, 10)
C = rand(Float32, 10, 10)
# Force compilation
seq_mat_mul_sdot(10, 10, 10, A, B, C)

clblas.setup(true)
device, ctx, queue = clblas.get_next_compute_context()

matSizes = Array(Tuple, COUNT)
for i in 1:COUNT
   matSizes[i] = (rand(20:100) * 32, rand(20:100) * 32, rand(20:100) * 32)
end

const alpha = 5.0
const beta  = 2.0

cpu_times        =  zeros(Float32, COUNT)
cpu_seq_times    =  zeros(Float32, COUNT)
gpu_times        =  zeros(Float32, COUNT)
gpu_times_block  =  zeros(Float32, COUNT)
gpu_times_clblas =  zeros(Float32, COUNT)

kernel_source = open(readall, "GEMM-NVIDIA.cl")
prg  = cl.Program(ctx, source=kernel_source) |> cl.build!
mmul = cl.Kernel(prg, "mmul")

kernel_source = open(readall, "block_form.cl")
prg2  = cl.Program(ctx, source=kernel_source) |> cl.build!
block_mmul = cl.Kernel(prg2, "mmul")

blocksize = 16
localmem1 = cl.LocalMem(Float32, blocksize^2)
localmem2 = cl.LocalMem(Float32, blocksize^2)

for id in 1:COUNT
   m, k, n = matSizes[id]
   A = rand(Float32, m, k)
   B = rand(Float32, k, n)
   C = rand(Float32, m, n)

   info("-----CPU------")
   startT = time()
     C_RES = alpha*A*B + beta*C
   runtime = time() - startT
   cpu_times[id] = runtime

   info("------ CPU SEQ ---------")
   startT = time()
   #seq_mat_mul_sdot(n, m, k, A, B, C)
   runtime = time() - startT
   cpu_seq_times[id] = runtime

   info("-----GPU------")
   A_buf = cl.Buffer(Float32, ctx, (:r, :copy), hostbuf=A)
   B_buf = cl.Buffer(Float32, ctx, (:r, :copy), hostbuf=B)
   C_buf = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=C)

   evt = mmul[queue, (m, n), (blocksize, blocksize)](convert(Csize_t, m), convert(Csize_t, k),
                                                     alpha, beta, C_buf, A_buf, B_buf, localmem1, localmem2)
   runtime = evt[:profile_duration] / 1e9
   gpu_times[id] = runtime

   info("-----GPU BLOCK------")
   evt = cl.call(queue, block_mmul, (m, n), (16,16),
                 int32(m), int32(k),
                 C_buf, A_buf, B_buf, localmem1, localmem2)
   runtime = evt[:profile_duration] / 1e9
   gpu_times_block[id] = runtime

   info("-----GPU CLBLAS------")
   m = convert(Csize_t, m)
   k = convert(Csize_t, k)
   n = convert(Csize_t, n)

   lda = m
   ldb = k
   ldc = m

   event = cl.UserEvent(ctx)
   ptr_event = [pointer(event)]

   startT = time()
   clblas.clblasSgemm(1, 0, 0, m, n, k,
                           alpha, pointer(A_buf), 0, lda,
                           pointer(B_buf), 0, ldb, beta,
                           pointer(C_buf), 0, ldc,
                           1, [pointer(queue)],
                           0, C_NULL, pointer(ptr_event))

   cl.finish(queue)
   endT = time()
#   startT = cl.CL_ulong[0]
#   cl.api.clGetEventProfilingInfo( event.id, cl.CL_PROFILING_COMMAND_START, sizeof(cl.CL_long), startT, C_NULL)
#   println("Start:", startT[1])

#   endT = cl.CL_ulong[0]
#   cl.api.clGetEventProfilingInfo(event.id, cl.CL_PROFILING_COMMAND_END, sizeof(cl.CL_long), endT, C_NULL)
#   println("End:", endT[1])


#   runtime = (endT[1] - startT[1] ) / 1e9
   gpu_times_clblas[id] = endT - startT
end

using PyCall
@pyimport matplotlib.pyplot as plt
#plt.plot([1:COUNT], cpu_seq_times, color="blue", linewidth=2.0, linestyle="--", label="CPU")
plt.plot([1:COUNT], cpu_times, color="red", linewidth=2.0, linestyle="--", label="CPU")
plt.plot([1:COUNT], gpu_times, color="orange", linewidth=2.0, linestyle="--", label="GPU")
plt.plot([1:COUNT], gpu_times_block, color="green", linewidth=2.0, linestyle="--", label="GPU Block")
plt.plot([1:COUNT], gpu_times_clblas, color="black", linewidth=2.0, linestyle="--", label="GPU BLAS")

plt.ylabel("time in seconds")
plt.title("CPU vs GPU times")
plt.show()


