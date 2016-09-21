import CLBLAS
import OpenCL.cl

    const clblas = CLBLAS
    clblas.setup()    
    alpha = cl.cl_float(5)
    beta = cl.cl_float(2)
    # Order of the square matrices A, B and C
    ORDER = 512
    # A elemetns are constant and equal to AVAL
    AVAL = 3.3
    # B elemetns are constant and equal to BVAL
    BVAL = 1.6

    CVAL = 1.77

    # A[N,P], B[P M], C[N,M]
    Ndim = ORDER
    Pdim = ORDER
    Mdim = ORDER

    # Number of elements in the matrix
    sizeA = Ndim * Pdim
    sizeB = Pdim * Mdim
    sizeC = Ndim * Mdim

    # Number of elements in the matrix
    h_A = fill(Float32(AVAL), sizeA)
    h_B = fill(Float32(BVAL), sizeB)
    h_C = fill(Float32(CVAL), sizeC)

    data = reshape(h_A, Ndim, Pdim)*reshape(h_B, Pdim, Mdim) * 5 + 2.0*reshape(h_C, Ndim, Mdim)

    device, ctx, queue = clblas.get_next_compute_context()
    kernel_source = open(readall, "GEMM-NVIDIA.cl")
    prg  = cl.Program(ctx, source=kernel_source) |> cl.build!
    mmul = cl.Kernel(prg, "mmul")
    info("Kernel is ready")

    d_a = cl.Buffer(Float32, ctx, (:r,:copy), hostbuf=h_A)
    d_b = cl.Buffer(Float32, ctx, (:r,:copy), hostbuf=h_B)
    d_c = cl.Buffer(Float32, ctx, (:rw,:copy), hostbuf=h_C)

    blocksize = 32
    localmem1 = cl.LocalMem(Float32, blocksize^2)
    localmem2 = cl.LocalMem(Float32, blocksize^2)

    evt = mmul[queue, (Ndim, Mdim), (blocksize, blocksize)](Mdim, Ndim, alpha, beta, d_c, d_a, d_b, localmem1, localmem2)
    cl.api.clWaitForEvents(cl.cl_uint(1), pointer([pointer(evt)]))

    result = Array(Float32, 512 * 512)
    cl.enqueue_read_buffer(queue, d_c, result, unsigned(0), nothing, true)
    result = reshape(result, (Ndim, Mdim))

    println(result)
    println("------------")
    println(data)
    println(result == data)
    info("success!")

    clblas.teardown()
