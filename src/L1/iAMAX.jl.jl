@api.blas_func(clblasiSamax, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasiSamax, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasiDamax, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasiDamax, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasiCamax, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasiCamax, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasiZamax, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasiZamax, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))
