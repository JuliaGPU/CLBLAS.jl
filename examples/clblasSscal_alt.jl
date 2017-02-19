import CLBLAS
import OpenCL    
    const clblas = CLBLAS
    clblas.setup()
    using OpenCL: cl

    device, ctx, queue = clblas.get_next_compute_context()

    N = Unsigned(5)
    alpha1 = cl.cl_float(5)
    alpha2 = cl.cl_float(2)
    data = Vector{Float32}(5)
    data[1] = 0.1
    data[2] = 0.22
    data[3] = 0.333
    data[4] = 0.4444
    data[5] = 0.55555

    X = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=data)
    offx = Unsigned(0)
    incx = cl.cl_int(1)
    ncq = cl.cl_uint(1)
    clq = queue.id
    newl = cl.cl_uint(0)

    ptrEvent = clblas.clblasSscal(N, alpha1, X.id, offx, incx, [queue])

    ptrEvent2 = clblas.clblasSscal(N, alpha2, X.id, offx, incx,[queue], ptrEvent)

    cl.api.clWaitForEvents(cl.cl_uint(1), ptrEvent2)

    result = Vector{Float32}(length(X))
    cl.enqueue_read_buffer(queue, X, result, Unsigned(0), nothing, true)

    expected = data * alpha1 * alpha2
    println(result)
    println("------------")
    println(expected)

    try
        @assert(expected == result)
        info("success!")
    finally
        clblas.teardown()
    end
