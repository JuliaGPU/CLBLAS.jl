@api.blas_func(clblasSgemv, (clblasOrder, clblasTranspose,
               Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasSgemv, (clblasOrder, clblasTranspose,
               Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasDgemv, (clblasOrder, clblasTranspose,
               Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_double, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDgemv, (clblasOrder, clblasTranspose,
               Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_double, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasCgemv, (clblasOrder, clblasTranspose,
               Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, FloatComplex, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasCgemv, (clblasOrder, clblasTranspose,
               Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, FloatComplex, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZgemv, (clblasOrder, clblasTranspose,
              Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint, DoubleComplex, cl.CL_mem, Csize_t, Cint,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasZgemv, (clblasOrder, clblasTranspose,
              Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint, DoubleComplex, cl.CL_mem, Csize_t, Cint))
