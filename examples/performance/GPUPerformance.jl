import CLBLAS
import OpenCL

const cl = OpenCL
const clblas = CLBLAS


function randomMatrixSize(num::Int)
   # Format is (m,k,n) so matrix mul is (m,n)
   matSizes = Array(Tuple, num)
   for i in 1:num
      matSizes[i] = (rand(20:100) * 32, rand(20:100) * 32, rand(20:100) * 32)
   end
   return matSizes
end

function cpu_gemm(A, B, C, alpha, beta)
    startT = time()
    C = alpha*A*B + beta*C
    runtime = time() - startT
    runtime
end

function gpu_gemm(A, B, C, alpha, beta)
     const alphaF = cl.cl_float(alpha)
     const betaF  = cl.cl_float(beta)
     const u_zero = uint32(0)

     startT = time()
     future = clblas.clblasSgemm(u_zero, u_zero, alphaF, A, B, betaF, C)
     cl.api.clWaitForEvents(1, pointer(future.event))
     runtime = time() - startT
     runtime
end

function gpu_clblas_gemm(ctx, queue, AData, BData, CData, alpha, beta)
     A = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=AData)
     B = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=BData)
     C = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=CData)

     m, k = size(AData)
     k, n = size(BData)
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
                             alpha, pointer(A), 0, lda,
                             pointer(B), 0, ldb, beta,
                             pointer(C), 0, ldc,
                             1, [pointer(queue)],
                             0, C_NULL, pointer(ptr_event))

     cl.api.clWaitForEvents(1, pointer(ptr_event))
     runtime = time() - startT
     runtime
end

function gpu_gemm_block(ctx, queue, kernel, AData, BData, CData, alpha, beta)
     A = cl.Buffer(Float32, ctx, (:r, :copy), hostbuf=AData)
     B = cl.Buffer(Float32, ctx, (:r, :copy), hostbuf=BData)
     C = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=CData)

     m, k = size(AData)
     k, n = size(BData)

     blocksize = 16
     localmem1 = cl.LocalMem(Float32, blocksize^2)
     localmem2 = cl.LocalMem(Float32, blocksize^2)

     evt = kernel[queue, (m, n), (blocksize, blocksize)](convert(Csize_t, m), convert(Csize_t, k), alpha, beta, C, A, B, localmem1, localmem2)
     runtime = evt[:profile_duration] / 1e9
     runtime
end


function many_gc(num)
   for id in 1:num
      gc()
   end
end

function run(device, context, queue, kernel, num)
   cpu_times     =  zeros(Float32, num)
   gpu_times     =  zeros(Float32, num)
   gpu_times_fut = zeros(Float32, num)
   gpu_times_blk = zeros(Float32, num)

   matrix_sizes = randomMatrixSize(num)
   alpha = 5.0
   beta = 2.0

   #gc_disable()
   for id in 1:num
      m, k, n = matrix_sizes[1]
      A = rand(Float32, m, k)
      B = rand(Float32, k, n)
      C = rand(Float32, m, n)

      gpu_times[id]     = gpu_clblas_gemm(context, queue, A, B, C, alpha, beta)
      gpu_times_fut[id] = gpu_gemm(A, B, C, alpha, beta)
      gpu_times_blk[id] = gpu_gemm_block(context, queue, kernel, A, B, C, alpha, beta)
      cpu_times[id]     = cpu_gemm(A, B, C, alpha, beta)
   end
   #gc_enable()

   (cpu_times, gpu_times, gpu_times_fut, gpu_times_blk)
end

function simulate(num, verbose = false)
    clblas.setup(true)
    if(verbose)
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
    end

    device, context, queue = clblas.get_next_compute_context()
    kernel_source = open(readall, "GEMM-NVIDIA.cl")
    prg  = cl.Program(context, source=kernel_source) |> cl.build!
    mmul = cl.Kernel(prg, "mmul")

    run(device, context, queue, mmul, 2)

    cpu_times, gpu_times, gpu_times_fut, gpu_times_blk = run(device, context, queue, mmul, num)
    cpu_avg     = sum(cpu_times)/num
    gpu_avg     = sum(gpu_times)/num
    gpu_fut_avg = sum(gpu_times_fut)/num
    gpu_blk_avg = sum(gpu_times_blk)/num
    println("Average CPU    :", cpu_avg)
    println("Average GPU    :", gpu_avg)
    println("Average GPU FUT:", gpu_fut_avg)
    println("Average GPU BLK:", gpu_blk_avg)
    println("GPU BLAS xer CPU    :", cpu_avg / gpu_avg)
    println("GPU FUT  xer CPU    :", cpu_avg / gpu_fut_avg)
    println("GPU BLK  xer CPU    :", cpu_avg / gpu_blk_avg)

    clblas.teardown()
end

num = int(ARGS[1])
simulate(num)

#@pyimport matplotlib.pyplot as plt
#plt.plot([1:num], gpuMmulTimes2, color="green", linewidth=2.0, linestyle="--", label="GPU-Mul2")
#plt.plot([1:num], cpuTimes, color="red", linewidth=2.0, linestyle="--", label="CPU")
#plt.plot([1:num], gpuTimes, color="blue", linewidth=2.0, linestyle="--", label="GPU")
##plt.plot([1:num], gpuMmulTimes, color="yellow", linewidth=2.0, linestyle="--", label="GPU-Mul")

#plt.ylabel("time ns")
#plt.title("CPU vs GPU times")
#plt.show()


