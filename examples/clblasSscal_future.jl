import clBLAS

    clblas.setup()
    const cl = OpenCL
    alpha::Float32 = 10
    data = Array(Float32, 5)
    data[1] = 0.1
    data[2] = 0.22
    data[3] = 0.333
    data[4] = 0.4444
    data[5] = 0.55555

    alpha1 ::Float32 = 5
    alpha2 ::Float32 = 2
    future = clblas.clblasSscal(data, alpha1)
    future = clblas.clblasSscal(future, alpha2)

    result = fetch(future)
    println(result)
    println("------------")
    expected = data * alpha
    println(expected)

    @assert(isapprox(norm(result - expected), zero(Float32)))
    info("success!")

    clblas.teardown()
