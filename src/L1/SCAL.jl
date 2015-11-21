# keeping old API here since future-based clblasSscal uses it 

@api.blas_func(clblasSscal, (Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasSscal, (Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasDscal, (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasDscal, (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasCscal, (Csize_t, cl.CL_float2, cl.CL_mem, Csize_t, Cint,
                          cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                          Ptr{cl.CL_event}))

@api.blas_func2(clblasCscal, (Csize_t, cl.CL_float2, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZscal, (Csize_t, cl.CL_double2, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasZscal, (Csize_t, cl.CL_double2, cl.CL_mem, Csize_t, Cint))


import OpenCL
const cl = OpenCL

macro blas_scal(func, argType1, argType2)
     quote
         function $(esc(func))( future_or_data::@compat(Union{$argType1, Future}), alpha::$argType2)
             future = to_futures(future_or_data)[1]
             req_num_events, events = getEvents(future)
             future_to_return = Future(future.ctx, future.queue, future.mem, future.dims)

             $(esc(func))(length(future.mem), alpha, pointer(future.mem),
                         convert(Csize_t, 0), convert(Cint, 1), cl.cl_uint(1),
                         [pointer(future_to_return.queue)], req_num_events, events,
                         future_to_return.event)
             return future_to_return
          end
     end
end


@blas_scal(clblasSscal, Vector{Float32}, Float32)
@blas_scal(clblasDscal, Vector{Float64}, Float64)
#@blas_scal(clblasCscal, Vector{cl.CL_float2}, cl.CL_float2)
#@blas_scal(clblasZscal, Vector{cl.CL_double2}, cl.CL_double2)



for (func, typ) in [(:clblasSscal, cl.CL_float),
                    (:clblasDscal, cl.CL_double),
                    (:clblasCscal, CL_float2),
                    (:clblasZscal, CL_double2)]
    
    @eval @blasfun $func(N::Csize_t, alpha::CL_double2,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(N::Csize_t, alpha::CL_double2,
                               X::cl.CL_mem, offx::Csize_t, incx::Cint)
    
end
