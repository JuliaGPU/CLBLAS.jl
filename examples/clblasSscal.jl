import clBLAS

    clblas.setup()
    const cl = OpenCL

    device, ctx, queue = clblas.get_next_compute_context()

    N = unsigned(5)
    alpha1 = cl.cl_float(5)
    alpha2 = cl.cl_float(2)
    local data = Array(Float32, 5)
    data[1] = 0.1
    data[2] = 0.22
    data[3] = 0.333
    data[4] = 0.4444
    data[5] = 0.55555

    local X = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=data)
    local offx = unsigned(0)
    local incx = cl.cl_int(1)
    local ncq = cl.cl_uint(1)
    local clq = queue.id
    local newl = cl.cl_uint(0)

    local event = cl.UserEvent(ctx, retain=true)
    local ptrEvent = [event.id]
    clblas.clblasSscal(N, alpha1, X.id, offx, incx, ncq, [clq], newl, C_NULL, ptrEvent)

    local event2 = cl.UserEvent(ctx, retain=true)
    local ptrEvent2 = [event2.id]
    clblas.clblasSscal(N, alpha2, X.id, offx, incx, ncq, [clq], cl.cl_uint(1), ptrEvent, ptrEvent2)

    cl.api.clWaitForEvents(cl.cl_uint(1), ptrEvent2)

    local result = Array(Float32, length(X))
    cl.enqueue_read_buffer(queue, X, result, unsigned(0), nothing, true)

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
