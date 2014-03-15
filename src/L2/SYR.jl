@api.blas_func(clblasSsyr, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_float,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasSsyr, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_float,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasDsyr, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_double,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDsyr, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_double,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Csize_t))
