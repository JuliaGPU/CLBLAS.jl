@api.blas_func(clblasSger, (clblasOrder,
               Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasSger, (clblasOrder,
               Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasDger, (clblasOrder,
               Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDger, (clblasOrder,
               Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Csize_t))
