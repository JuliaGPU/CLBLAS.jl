@api.blas_func(clblasChbmv, (clblasOrder, clblasUplo,
               Csize_t, Csize_t, cl.CL_float2,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float2, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasChbmv, (clblasOrder, clblasUplo,
               Csize_t, Csize_t, cl.CL_float2,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float2, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZhbmv, (clblasOrder, clblasUplo,
               Csize_t, Csize_t, cl.CL_double2,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_double2, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasZhbmv, (clblasOrder, clblasUplo,
               Csize_t, Csize_t, cl.CL_double2,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_double2, cl.CL_mem, Csize_t, Cint))
