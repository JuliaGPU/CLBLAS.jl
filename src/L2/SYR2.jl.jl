@api.blas_func(clblasSsyr2, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_float,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasSsyr2, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_float,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasDsyr2, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_double,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDsyr2, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_double,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Csize_t))
