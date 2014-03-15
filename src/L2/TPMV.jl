@api.blas_func(clblasStpmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasStpmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem))

@api.blas_func(clblasDtpmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDtpmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem))

@api.blas_func(clblasCtpmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasCtpmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem))

@api.blas_func(clblasZtpmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t,
              cl.CL_mem, Csize_t,
              cl.CL_mem, Csize_t, Cint,
              cl.CL_mem,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasZtpmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t,
              cl.CL_mem, Csize_t,
              cl.CL_mem, Csize_t, Cint,
              cl.CL_mem))
