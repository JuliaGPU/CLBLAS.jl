@api.blas_func(clblasChpr2, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_float2,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasChpr2, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_float2,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t))

@api.blas_func(clblasZhpr2, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_double2,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasZhpr2, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_double2,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem, Csize_t))
