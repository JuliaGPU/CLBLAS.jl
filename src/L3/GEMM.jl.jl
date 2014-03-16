@api.blas_func(clblasSgemm, (clblasOrder, clblasTranspose, clblasTranspose,
               Csize_t, Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasSgemm, (clblasOrder, clblasTranspose, clblasTranspose,
               Csize_t, Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasSgemm, (clblasOrder, clblasTranspose, clblasTranspose,
              Csize_t, Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasSgemm, (clblasOrder, clblasTranspose, clblasTranspose,
              Csize_t, Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasCgemm, (clblasOrder, clblasTranspose, clblasTranspose,
            Csize_t, Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
            cl.CL_mem, Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
            cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
            Ptr{cl.CL_event}))

@api.blas_func2(clblasCgemm, (clblasOrder, clblasTranspose, clblasTranspose,
            Csize_t, Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
            cl.CL_mem, Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZgemm, (clblasOrder, clblasTranspose, clblasTranspose,
              Csize_t, Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasZgemm, (clblasOrder, clblasTranspose, clblasTranspose,
              Csize_t, Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t))
