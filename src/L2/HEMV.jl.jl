@api.blas_func(clblasChemv, (clblasOrder, clblasUplo,
               Csize_t, FloatComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, FloatComplex, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasChemv, (clblasOrder, clblasUplo,
               Csize_t, FloatComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, FloatComplex, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZhemv, (clblasOrder, clblasUplo,
               Csize_t, DoubleComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, DoubleComplex, cl.CL_mem, Csize_t, Cint,
               cl.cl_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
               Ptr{cl.CL_event}))

@api.blas_func2(clblasZhemv, (clblasOrder, clblasUplo,
               Csize_t, DoubleComplex,
               cl.CL_mem, Csize_t, Csize_t,
               cl.CL_mem, Csize_t, Cint, DoubleComplex, cl.CL_mem, Csize_t, Cint))
