@api.blas_func(clblasSsyr2k, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_float,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_float,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasSsyr2k, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_float,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_float,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasDsyr2k, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_double,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_double,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDsyr2k, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_double,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.cl_double,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasCsyr2k, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, FloatComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, FloatComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasCsyr2k, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, FloatComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, FloatComplex,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZsyr2k, (clblasOrder, clblasUplo, clblasTranspose,
              Csize_t, Csize_t, DoubleComplex,
              cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t, DoubleComplex,
              cl.CL_mem, Csize_t, Csize_t,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasZsyr2k, (clblasOrder, clblasUplo, clblasTranspose,
              Csize_t, Csize_t, DoubleComplex,
              cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t, DoubleComplex,
              cl.CL_mem, Csize_t, Csize_t))
