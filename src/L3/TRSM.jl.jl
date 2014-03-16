@api.blas_func(clblasStrsm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t, cl.cl_float, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasStrsm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t, cl.cl_float, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasDtrsm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t, cl.cl_double, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDtrsm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t, cl.cl_double, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasCtrsm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasCtrsm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t, Csize_t, FloatComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZtrsm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))


@api.blas_func2(clblasZtrsm, (clblasOrder, clblasSide, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t, Csize_t, DoubleComplex, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t))
