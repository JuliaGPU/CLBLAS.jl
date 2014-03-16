@api.blas_func(clblasSrotmg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                             cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasSrotmg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                             cl.CL_mem, Csize_t, cl.CL_mem, Csize_t))

@api.blas_func(clblasDrotmg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                             cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasDrotmg, ( cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t,
                             cl.CL_mem, Csize_t, cl.CL_mem, Csize_t))
