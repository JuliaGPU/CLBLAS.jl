import CLBLAS
import OpenCL

    const clblas = CLBLAS
    clblas.setup()
    
    const cl = OpenCL

    device, ctx, queue = clblas.get_next_compute_context()

    N = unsigned(5)
    data = Array(Float32, 5)
    
    data[1] = 5.55555
    data[2] = 3.333
    data[3] = 2.22
    data[4] = 4.4444
    data[5] = 1.1

    bufX = cl.Buffer(Float32, ctx, (:r, :copy),hostbuf=data)
    scratchBuff = cl.Buffer(Float32, ctx, :rw, 2 * length(data))
    iMax = cl.Buffer(cl.CL_uint, ctx, :w, 1)

    offiMax = offx = unsigned(0)
    incx = cl.cl_int(1)
    ncq = cl.cl_uint(1)
    clq = queue.id
    newl = cl.cl_uint(0)

    event = cl.UserEvent(ctx, retain=true)
    ptrEvent = [event.id]

    clblas.clblasiSamax( N, iMax.id, offiMax, bufX.id, offx, incx, scratchBuff.id, ncq, [clq], newl, C_NULL, ptrEvent);

    cl.api.clWaitForEvents(cl.cl_uint(1), ptrEvent)

    result = Array(cl.CL_uint, 1)
    cl.enqueue_read_buffer(queue, iMax, result, unsigned(0), nothing, true)
    
    result = int(floor(result[1])) 

    expected = float32(5.55555) 
    println(data[result])
    println("------------")
    println(expected)

    try
        @assert(isapprox(norm(expected - data[result]), zero(Float32)))
        info("success!")
    finally
        clblas.teardown()
    end
