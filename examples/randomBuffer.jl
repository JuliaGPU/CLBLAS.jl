using CLBLAS
const clblas = CLBLAS

import OpenCL
const cl = OpenCL

function testDirectCall()
        device, ctx, queue = clblas.get_next_compute_context()
        A = rand(Float32, 1)
        B = rand(Float32, 1)
        C = rand(Float32, 1)
        println(A, B, C)
        a = cl.cl_float(6.6)
        b = cl.cl_float(7.2)

        bufA = cl.Buffer(Float32, ctx, (:r, :copy),hostbuf=A)
        bufB = cl.Buffer(Float32, ctx, (:r, :copy),hostbuf=B)
        bufC = cl.Buffer(Float32, ctx, (:rw, :copy),hostbuf=C)

        event = cl.UserEvent(ctx, retain=true)
        ptrEvent = [event.id]


        println("ccalling!!!")
        clblas.clblasSgemm(1, 0, 0,
                    convert(Csize_t, 1), convert(Csize_t, 1), convert(Csize_t, 1),
                    a, bufA.id, convert(Csize_t, 0), convert(Csize_t, 1),
                    bufB.id, convert(Csize_t, 0), convert(Csize_t, 1), b,
                    bufC.id, convert(Csize_t, 0), convert(Csize_t, 1),
                    cl.cl_uint(1), [queue.id],
                    cl.cl_uint(0),
                    C_NULL,
                    ptrEvent)
        println("ccall was ok")
        cl.api.clWaitForEvents(cl.cl_uint(1), ptrEvent)

        println("wait was ok")
        result = Array(Float32, 1)
        cl.enqueue_read_buffer(queue, bufC, result, unsigned(0), nothing, true)
        println("read was ok")
        println(result[1])

end

function testRandMul()

     a = float32(3)
     A = float32([3])
     println(A)
     println(eltype(A))
     B = float32([3])
     b = float32(3)
     C = float32([3])

     println("Normal:", (a*A[1]*B[1] + b*C[1]))

     startT = time_ns()
     futBuf = clblas.clblasSgemm(clblas.clblasColumnMajor.n, clblas.clblasNoTrans.n, clblas.clblasNoTrans.n,
                                 1, a, A,
                                 1, B,
                                 1, b, C)
     result = fetch(futBuf)
     endT = time_ns()

     println("RandMul took:", (endT - startT)/1000000)
     println("Result:", result)
end

 clblas.setup(true)
function testRandBuf(x, y)
     #startT = time_ns()
     futBuf = clblas.randBuf(x, y)
     #futBuf = clblas.clblasSscal(futBuf, cl.cl_float(13.13))
     mat    =  clblas.fetch(futBuf)
     #endT = time_ns()

     #println(futBuf.actualEvent[:status])
     #println(futBuf.actualEvent[:profile_duration])
     #println("RandBuf took:", (endT - startT)/1000000)
     #println(mat)
end

function testRand(x, y)
    startT = time_ns()
    test = rand(x, y) * 13.13
    endT = time_ns()
    println("Rand took:", (endT - startT)/1000000)
end

#result = Array(Float32, length(futBuf.resultMem))
#cl.enqueue_read_buffer(futBuf.queue, futBuf.resultMem, result, unsigned(0), nothing, true)
#println(result)

