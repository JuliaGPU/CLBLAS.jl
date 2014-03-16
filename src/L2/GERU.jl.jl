@api.blas_func(clblasCgeru, (clblasOrder,
               Csize_t, Csize_t, cl.CL_float2, cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasCgeru, (clblasOrder,
               Csize_t, Csize_t, cl.CL_float2, cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZgeru, (clblasOrder,
               Csize_t, Csize_t, cl.CL_double2, cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasZgeru, (clblasOrder,
               Csize_t, Csize_t, cl.CL_double2, cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Csize_t))
