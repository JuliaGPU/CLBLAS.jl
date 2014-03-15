@api.blas_func(clblasStpsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasStpsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasDtpsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDtpsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasCtpsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t,
              cl.CL_mem, Csize_t,
              cl.CL_mem, Csize_t, Cint,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasCtpsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t,
              cl.CL_mem, Csize_t,
              cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZtpsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
             Csize_t,
             cl.CL_mem, Csize_t,
             cl.CL_mem, Csize_t, Cint,
             cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
             Ptr{cl.CL_event}))

@api.blas_func2(clblasZtpsv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
             Csize_t,
             cl.CL_mem, Csize_t,
             cl.CL_mem, Csize_t, Cint))
