import OpenCL
const cl = OpenCL

@api.blas_func(clblasSgemm, (Uint32, Uint32, Uint32,
                             Csize_t, Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t,
                             cl.CL_mem, Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasSgemm, (Uint32, Uint32, Uint32,
                Csize_t, Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t,
                cl.CL_mem, Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t))

macro blas_gemm(func, arrType, mulType)
    quote
        function $(esc(func))( at::Uint32, bt::Uint32,
                alpha::$mulType, A::Union($arrType, Future),
                B::Union($arrType, Future), beta::$mulType, C::Union($arrType, Future))


            futures = to_futures(A, B, C)
            m = convert(Csize_t, futures[1].dims[1])
            n = convert(Csize_t, futures[2].dims[2])
            k = convert(Csize_t, futures[1].dims[2])

            ctx   = futures[3].ctx
            queue = futures[3].queue
            req_num_events, events = getEvents(futures)
            future_to_return = Future(ctx, queue, futures[3].mem, futures[3].dims)

            lda = m
            ldb = k
            ldc = m

            $(esc(func))(uint32(1), at, bt,
                        m, n, k,
                        alpha, pointer(futures[1].mem), 0, lda,
                        pointer(futures[2].mem), 0, ldb, beta,
                        pointer(futures[3].mem), 0, ldc,
                        uint32(1), [pointer(queue)],
                        req_num_events,
                        events,
                        future_to_return.event)

            return future_to_return
         end
    end
end

@blas_gemm(clblasSgemm, Array{cl.CL_float}, cl.CL_float)

@api.blas_func(clblasDgemm, (Uint32, Uint32, Uint32,
              Csize_t, Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasDgemm, (Uint32, Uint32, Uint32,
              Csize_t, Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasCgemm, (Uint32, Uint32, Uint32,
            Csize_t, Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
            cl.CL_mem, Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
            cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
            Ptr{cl.CL_event}))

@api.blas_func2(clblasCgemm, (Uint32, Uint32, Uint32,
            Csize_t, Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
            cl.CL_mem, Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZgemm, (Uint32, Uint32, Uint32,
              Csize_t, Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasZgemm, (Uint32, Uint32, Uint32,
              Csize_t, Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t))
