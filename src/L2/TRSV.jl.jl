@api.blas_func(clblasStrsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasStrsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasDtrsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDtrsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasCtrsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t,
              cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasCtrsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t,
              cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZtrsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
             Csize_t,
             cl.CL_mem, Csize_t, Csize_t,
             cl.CL_mem, Csize_t, Cint,
             cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
             Ptr{cl.CL_event}))

@api.blas_func2(clblasZtrsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
             Csize_t,
             cl.CL_mem, Csize_t, Csize_t,
             cl.CL_mem, Csize_t, Cint))
