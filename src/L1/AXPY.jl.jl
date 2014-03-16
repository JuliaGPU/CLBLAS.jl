@api.blas_func(clblasSaxpy, (Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasSaxpy, (Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasDaxpy, (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
                            cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                            Ptr{cl.CL_event}))

@api.blas_func2(clblasDaxpy, (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasCaxpy, (Csize_t, CL_float2, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
                            cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                            Ptr{cl.CL_event}))

@api.blas_func2(clblasCaxpy, (Csize_t, CL_float2, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZaxpy, (Csize_t, CL_double2, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasZaxpy, (Csize_t, CL_double2, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))
