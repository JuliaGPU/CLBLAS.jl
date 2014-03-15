@api.blas_func(clblasCher2k, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_float, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasCher2k, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_float, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZher2k, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_double, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasZher2k, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_double, cl.CL_mem, Csize_t, Csize_t))
