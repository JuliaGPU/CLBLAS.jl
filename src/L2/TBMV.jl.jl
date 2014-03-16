@api.blas_func(clblasStbmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasStbmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem))

@api.blas_func(clblasDtbmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasDtbmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem))

@api.blas_func(clblasCtbmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint,
              cl.CL_mem,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasCtbmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
              Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint,
              cl.CL_mem))

@api.blas_func(clblasZtbmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
               Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint,
               cl.CL_mem,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

 @api.blas_func2(clblasZtbmv, (clblasOrder, clblasUplo, clblasTranspose, clblasDiag,
                Csize_t, Csize_t,
                cl.CL_mem, Csize_t, Csize_t,
                cl.CL_mem, Csize_t, Cint,
                cl.CL_mem))

