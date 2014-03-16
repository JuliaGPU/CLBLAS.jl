@api.blas_func(clblasSrotm, ( Csize_t, cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasSrotm, ( Csize_t, cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t))

@api.blas_func(clblasDrotm, ( Csize_t, cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t,
                          cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                          Ptr{cl.CL_event}))

@api.blas_func2(clblasDrotm, ( Csize_t, cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t, Cint,
                                       cl.CL_mem, Csize_t))
