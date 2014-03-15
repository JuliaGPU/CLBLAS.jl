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
         function $(esc(func))( future_or_data::Union($argType1, Future), alpha::$argType2)
             ctx, queue, number_of_elements, mem, req_num_events, events =
                                  find_compute_context(future_or_data)
             future_to_return = Future(ctx, queue, mem)

             $(esc(func))(number_of_elements, alpha, pointer(mem),
                         convert(Csize_t, 0), convert(Cint, 1), cl.cl_uint(1),
                         [pointer(queue)], req_num_events, events,
                         future_to_return.events)

             return future_to_return
          end
     end
end


@blas_scal(clblasSscal, Vector{Float32}, Float32)
@blas_scal(clblasDscal, Vector{Float64}, Float64)
#@blas_scal(clblasCscal, Vector{cl.CL_float2}, cl.CL_float2)
#@blas_scal(clblasZscal, Vector{cl.CL_double2}, cl.CL_double2)
