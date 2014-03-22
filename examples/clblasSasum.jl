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

    bufX = cl.Buffer(Float32, ctx, (:r, :copy),hostbuf=data)
    bufAsum = cl.Buffer(Float32, ctx, :w, length(bufX))
    scratchBuff = cl.Buffer(Float32, ctx, :rw, length(bufX))

    offx = unsigned(0)
    incx = cl.cl_int(1)
    ncq = cl.cl_uint(1)
    clq = queue.id
    newl = cl.cl_uint(0)

    event = cl.UserEvent(ctx, retain=true)
    ptrEvent = [event.id]

    clblas.clblasSasum( N, bufAsum.id, 0, bufX.id, 0, incx, scratchBuff.id,
                                    ncq, [clq], newl, C_NULL, ptrEvent);

    cl.api.clWaitForEvents(cl.cl_uint(1), ptrEvent)

    result = Array(Float32, length(1))
    cl.enqueue_read_buffer(queue, bufAsum, result, unsigned(0), nothing, true)
    
    expected = data[1:end] |> sum
    println(result)
    println("------------")
    println(expected)

    try
        @assert(isapprox(norm(expected - result[1]), zero(Float32)))
        info("success!")
    finally
        clblas.teardown()
    end
