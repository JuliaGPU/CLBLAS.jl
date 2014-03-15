@api.blas_func(clblasCsscal, (Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasCsscal, (Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZdscal, (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasZdscal, (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint))
