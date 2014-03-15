@api.blas_func(clblasStrmm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t, cl.cl_float, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasStrmm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t, cl.cl_float, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasDtrmm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t, cl.cl_double, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDtrmm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t, Csize_t, cl.cl_double, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasCtrmm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasCtrmm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZtrmm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasZtrmm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t))

