@api.blas_func(clblasSgbmv, (clblasOrder, clblasTranspose,
               Csize_t, Csize_t, Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasSgbmv, (clblasOrder, clblasTranspose,
               Csize_t, Csize_t, Csize_t, Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasDgbmv, (clblasOrder, clblasTranspose,
              Csize_t, Csize_t, Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint, cl.CL_double, cl.CL_mem, Csize_t, Cint,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasDgbmv, (clblasOrder, clblasTranspose,
              Csize_t, Csize_t, Csize_t, Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint, cl.CL_double, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasCgbmv, (clblasOrder, clblasTranspose,
               Csize_t, Csize_t, Csize_t, Csize_t, cl.CL_float2, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float2, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasCgbmv, (clblasOrder, clblasTranspose,
               Csize_t, Csize_t, Csize_t, Csize_t, cl.CL_float2, cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, cl.CL_float2, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZgbmv, (clblasOrder, clblasTranspose,
              Csize_t, Csize_t, Csize_t, Csize_t, cl.CL_double2, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint, cl.CL_double2, cl.CL_mem, Csize_t, Cint,
              cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
              Ptr{cl.CL_event}))

@api.blas_func2(clblasZgbmv, (clblasOrder, clblasTranspose,
              Csize_t, Csize_t, Csize_t, Csize_t, cl.CL_double2, cl.CL_mem, Csize_t, Csize_t,
              cl.CL_mem, Csize_t, Cint, cl.CL_double2, cl.CL_mem, Csize_t, Cint))
