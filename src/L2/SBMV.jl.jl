@api.blas_func(clblasSsbmv, (clblasOrder, clblasUplo,
               Csize_t, Csize_t, cl.CL_float,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasSsbmv, (clblasOrder, clblasUplo,
               Csize_t, Csize_t, cl.CL_float,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasDsbmv, (clblasOrder, clblasUplo,
               Csize_t, Csize_t, cl.CL_double,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_double, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDsbmv, (clblasOrder, clblasUplo,
               Csize_t, Csize_t, cl.CL_double,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_double, cl.CL_mem, Csize_t, Cint))
