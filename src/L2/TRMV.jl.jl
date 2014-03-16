@api.blas_func(clblasStrmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasStrmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem))

@api.blas_func(clblasDtrmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDtrmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem))

@api.blas_func(clblasCtrmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasCtrmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem))

@api.blas_func(clblasZtrmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t,
              cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint,
              cl.CL_mem,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasZtrmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t,
              cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint,
              cl.CL_mem))
