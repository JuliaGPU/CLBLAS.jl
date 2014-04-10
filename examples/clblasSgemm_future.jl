import CLBLAS
import OpenCL

    const clblas = CLBLAS
    clblas.setup()
    const cl = OpenCL
    alpha = cl.cl_float(5)
    beta = cl.cl_float(2)
    A = float32([1.0 2.0 3.0; 4.0 5.0 6.0])  #rand(Float32, 2, 3)
    B = float32([1.0 2.0; 3.0 4.0; 5.0 6.0]) #rand(Float32, 3, 2)
    C = float32([1.0 2.0; 3.0 4.0])#rand(Float32, 2, 2)

    println((5.0*A*B) + (2.0*C))

    future = clblas.clblasSgemm(uint32(0), uint32(0), alpha, A, B, beta, C)

    result = fetch(future)
    println(result)
    println("------------")

    #@assert(isapprox(norm(result - expected), zero(Float32)))
    info("success!")

    clblas.teardown()
