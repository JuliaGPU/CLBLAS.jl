@api.blas_func(clblasChemm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, CL_float2, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, CL_float2, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasChemm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, CL_float2, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, CL_float2, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZhemm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, CL_double2, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, CL_double2, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))


@api.blas_func2(clblasZhemm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, CL_double2, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, CL_double2, cl.CL_mem, Csize_t, Csize_t))
