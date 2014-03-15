@api.blas_func(clblasSasum, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasSasum, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasDasum, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasDasum, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasScasum, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasScasum, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasDzasum, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasDzasum, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))
