@api.blas_func(clblasSrotg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                             cl.CL_mem, Csize_t,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasSrotg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                             cl.CL_mem, Csize_t))

@api.blas_func(clblasDrotg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                          cl.CL_mem, Csize_t,
                          cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                          Ptr{cl.CL_event}))

@api.blas_func2(clblasDrotg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                          cl.CL_mem, Csize_t))

@api.blas_func(clblasCrotg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                       cl.CL_mem, Csize_t,
                       cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                       Ptr{cl.CL_event}))

@api.blas_func2(clblasCrotg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                       cl.CL_mem, Csize_t))

@api.blas_func(clblasZrotg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                        cl.CL_mem, Csize_t,
                        cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                        Ptr{cl.CL_event}))

@api.blas_func2(clblasZrotg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                        cl.CL_mem, Csize_t))
