@api.blas_func(clblasSdot, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                            cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                            cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                            Ptr{cl.CL_event}))

@api.blas_func2(clblasSdot, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                            cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasDdot, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                           cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                           cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                           Ptr{cl.CL_event}))

@api.blas_func2(clblasDdot, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                           cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasCdotu, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                             cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasCdotu, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                             cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasZdotu, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                             cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasZdotu, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                              cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasCdotc, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                             cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasCdotc, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                             cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasZdotc, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                             cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasZdotc, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint,
                             cl.CL_mem, Csize_t, Cint, cl.CL_mem))
