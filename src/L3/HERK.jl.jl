@api.blas_func(clblasCherk, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_float, cl.CL_mem, Csize_t, Csize_t, cl.cl_float,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasCherk, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_float, cl.CL_mem, Csize_t, Csize_t, cl.cl_float,
               cl.CL_mem, Csize_t, Csize_t))

@api.blas_func(clblasZherk, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_double, cl.CL_mem, Csize_t, Csize_t, cl.cl_double,
               cl.CL_mem, Csize_t, Csize_t,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasZherk, (clblasOrder, clblasUplo, clblasTranspose,
               Csize_t, Csize_t, cl.cl_double, cl.CL_mem, Csize_t, Csize_t, cl.cl_double,
               cl.CL_mem, Csize_t, Csize_t))
