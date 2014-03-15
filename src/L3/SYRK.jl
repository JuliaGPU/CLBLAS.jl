@api.blas_func(clblasSsyrk, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_float, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_float, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasSsyrk, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_float, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_float, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasDsyrk, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_double, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_double, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDsyrk, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_double, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_double, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasCsyrk, (clblasOrder, clblasUplo, clblasTranspose,
              Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
              FloatComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasCsyrk, (clblasOrder, clblasUplo, clblasTranspose,
              Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
              FloatComplex, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZsyrk, (clblasOrder, clblasUplo, clblasTranspose,
                Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
                DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
                cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                Ptr{cl.CL_event}))

@api.blas_func2(clblasZsyrk, (clblasOrder, clblasUplo, clblasTranspose,
                Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
                DoubleComplex, cl.CL_mem, Csize_t, Csize_t))
