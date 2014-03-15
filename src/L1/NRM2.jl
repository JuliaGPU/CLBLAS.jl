@api.blas_func(clblasSnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasSnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasDnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasDnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasScnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasScnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasDznrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasDznrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))
