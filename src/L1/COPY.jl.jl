@api.blas_func(clblasScopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasScopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasDcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasDcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasCcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasCcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
                            cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                            Ptr{cl.CL_event}))

@api.blas_func2(clblasZcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))
