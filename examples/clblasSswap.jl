import CLBLAS
import OpenCL

    const clblas = CLBLAS
    clblas.setup()
    
    const cl = OpenCL

    device, ctx, queue = clblas.get_next_compute_context()

    N = unsigned(5)
    data = Array(Float32, 5)
    data[1] = 1.1
    data[2] = 2.22
    data[3] = 3.333
    data[4] = 4.4444
    data[5] = 5.55555

    dat = Array(Float32, 5)
    dat[1] = 6.1
    dat[2] = 7.22
    dat[3] = 8.333
    dat[4] = 9.4444
    dat[5] = 10.55555

    bufX = cl.Buffer(Float32, ctx, (:rw, :copy),hostbuf=data)
    bufY = cl.Buffer(Float32, ctx, (:rw, :copy),hostbuf=dat)

    offx = unsigned(0)
    incx = cl.cl_int(1)
    incy = cl.cl_int(1)
    ncq = cl.cl_uint(1)
    clq = queue.id
    newl = cl.cl_uint(0)

    event = cl.UserEvent(ctx, retain=true)
    ptrEvent = [event.id]

    clblas.clblasSswap( N, bufX.id, 0, incx, bufY.id, 0, incy,
                                    ncq, [clq], newl, C_NULL, ptrEvent);

    cl.api.clWaitForEvents(cl.cl_uint(1), ptrEvent)

    result = Array(Float32, length(bufX))
    cl.enqueue_read_buffer(queue, bufY, result, unsigned(0), nothing, true)
    
    expected = data
    println(result)
    println("------------")
    println(expected)

    try
        @assert(isapprox(norm(expected - result), zero(Float32)))
        info("success!")
    finally
        clblas.teardown()
    end
