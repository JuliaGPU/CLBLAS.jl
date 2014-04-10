import CLBLAS
import OpenCL

    const clblas = CLBLAS
    clblas.setup()
    const cl = OpenCL
    alpha = cl.cl_float(5)
    beta = cl.cl_float(2)

    device, context, queue = clblas.get_next_compute_context()
    A = clblas.randBuf(8, 12; ctx=context, queue=queue)
    B = clblas.randBuf(12, 24; ctx=context, queue=queue)
    C = clblas.randBuf(8, 24; ctx=context, queue=queue)

    matA = clblas.fetch(A)
    matB = clblas.fetch(B)
    matC = clblas.fetch(C)

    data = (5.0*matA*matB) + (2.0*matC)
    println("data is good")
    future = clblas.clblasSgemm(uint32(0), uint32(0), alpha, A, B, beta, C)
    println("clblas gemm is done")

    result = fetch(future)
    println(result)
    println("------------")
    println(data)
    #@assert(result == data)
    info("success!")

    clblas.teardown()
