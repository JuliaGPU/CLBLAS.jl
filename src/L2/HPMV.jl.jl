@api.blas_func(clblasChpmv, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_float2,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float2,
               cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasChpmv, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_float2,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float2,
               cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZhpmv, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_double2,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_double2,
               cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasZhpmv, (clblasOrder, clblasUplo,
               Csize_t, cl.CL_double2,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_double2,
               cl.CL_mem, Csize_t, Cint))
