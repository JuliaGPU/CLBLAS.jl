@api.blas_func(clblasSrot, (Csize_t, cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t, Cint,
                                       cl.CL_float, cl.CL_float,
                              cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                              Ptr{cl.CL_event}))

@api.blas_func2(clblasSrot, (Csize_t, cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t, Cint,
                                       cl.CL_float, cl.CL_float))

@api.blas_func(clblasDrot, (Csize_t, cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t, Cint,
                                       cl.CL_double, cl.CL_double,
                              cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                              Ptr{cl.CL_event}))

@api.blas_func2(clblasDrot, (Csize_t, cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t, Cint,
                                       cl.CL_double, cl.CL_double))

@api.blas_func(clblasCsrot, (Csize_t, cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t, Cint,
                                       cl.CL_float, cl.CL_float,
                              cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                              Ptr{cl.CL_event}))

@api.blas_func2(clblasCsrot, (Csize_t, cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t, Cint,
                                       cl.CL_float, cl.CL_float))

@api.blas_func(clblasZdrot, (Csize_t, cl.CL_mem, Csize_t, Cint,
                                     cl.CL_mem, Csize_t, Cint,
                                     cl.CL_double, cl.CL_double,
                            cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                            Ptr{cl.CL_event}))

@api.blas_func2(clblasZdrot, (Csize_t, cl.CL_mem, Csize_t, Cint,
                                     cl.CL_mem, Csize_t, Cint,
                                     cl.CL_double, cl.CL_double))
