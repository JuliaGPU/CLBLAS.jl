@api.blas_func(clblasSswap,  (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint, cl.CL_uint,
                              Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event}, Ptr{cl.CL_event}))

@api.blas_func2(clblasSswap,  (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasDswap,  (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint, cl.CL_uint,
                              Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event}, Ptr{cl.CL_event}))

@api.blas_func2(clblasDswap,  (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasCswap,  (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint, cl.CL_uint,
                              Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event}, Ptr{cl.CL_event}))

@api.blas_func2(clblasCswap,  (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZswap,  (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint, cl.CL_uint,
                              Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event}, Ptr{cl.CL_event}))

@api.blas_func2(clblasZswap,  (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))
