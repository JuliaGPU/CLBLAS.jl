## @api.blas_func(clblasScopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
##                              cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
##                              Ptr{cl.CL_event}))

## @api.blas_func2(clblasScopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

## @api.blas_func(clblasDcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
##                              cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
##                              Ptr{cl.CL_event}))

## @api.blas_func2(clblasDcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

## @api.blas_func(clblasCcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
##                              cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
##                              Ptr{cl.CL_event}))

## @api.blas_func2(clblasCcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

## @api.blas_func(clblasZcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
##                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
##                             Ptr{cl.CL_event}))

## @api.blas_func2(clblasZcopy, (Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))


for func in [:clblasScopy, :clblasDcopy, :clblasCcopy, :clblasZcopy]
    @eval @api2.blasfun $func(N::Csize_t,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})
    @eval @api2.blasfun2 $func(N::Csize_t,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              Y::cl.CL_mem, offy::Csize_t, incy::Cint)
end
