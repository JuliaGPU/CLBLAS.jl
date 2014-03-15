@api.blas_func(clblasSsymm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, cl.cl_float,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_float,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasSsymm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, cl.cl_float,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_float,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasDsymm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, cl.cl_double,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_double,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDsymm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, cl.cl_double,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_double,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasCsymm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, FloatComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, FloatComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasCsymm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, FloatComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, FloatComplex,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZsymm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, DoubleComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, DoubleComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasZsymm, (clblasOrder, clblasSide, clblasUplo,
               Csize_t, Csize_t, DoubleComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, DoubleComplex,
               cl.CL_mem, Csize_t, Csize_t))
