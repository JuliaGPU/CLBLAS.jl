## @api.blas_func(clblasSaxpy, (Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
##                              cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
##                              Ptr{cl.CL_event}))

## @api.blas_func2(clblasSaxpy, (Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

## @api.blas_func(clblasDaxpy, (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
##                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
##                             Ptr{cl.CL_event}))

## @api.blas_func2(clblasDaxpy, (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

## @api.blas_func(clblasCaxpy, (Csize_t, CL_float2, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
##                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
##                             Ptr{cl.CL_event}))

## @api.blas_func2(clblasCaxpy, (Csize_t, CL_float2, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))

## @api.blas_func(clblasZaxpy, (Csize_t, CL_double2, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint,
##                              cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
##                              Ptr{cl.CL_event}))

## @api.blas_func2(clblasZaxpy, (Csize_t, CL_double2, cl.CL_mem, Csize_t, Cint, cl.CL_mem, Csize_t, Cint))


########################################################################

@api2.blasfun clblasSaxpy(n::Csize_t, alpha::cl.CL_float,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                          n_queues::cl.CL_uint,
                          queues::Ptr{cl.CL_command_queue},
                          n_events_in_wait_list::cl.CL_uint,
                          event_wait_list::Ptr{cl.CL_event},
                          events::Ptr{cl.CL_event})

@api2.blasfun2 clblasSaxpy(n::Csize_t, alpha::cl.CL_float,
                           X::cl.CL_mem, offx::Csize_t, incx::Cint,
                           Y::cl.CL_mem, offy::Csize_t, incy::Cint)


@api2.blasfun clblasDaxpy(n::Csize_t, alpha::cl.CL_double,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                          n_queues::cl.CL_uint,
                          queues::Ptr{cl.CL_command_queue},
                          n_events_in_wait_list::cl.CL_uint,
                          event_wait_list::Ptr{cl.CL_event},
                          events::Ptr{cl.CL_event})

@api2.blasfun2 clblasDaxpy(n::Csize_t, alpha::cl.CL_double,
                           X::cl.CL_mem, offx::Csize_t, incx::Cint,
                           Y::cl.CL_mem, offy::Csize_t, incy::Cint)


@api2.blasfun clblasCaxpy(n::Csize_t, alpha::CL_float2,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                          n_queues::cl.CL_uint,
                          queues::Ptr{cl.CL_command_queue},
                          n_events_in_wait_list::cl.CL_uint,
                          event_wait_list::Ptr{cl.CL_event},
                          events::Ptr{cl.CL_event})

@api2.blasfun2 clblasCaxpy(n::Csize_t, alpha::CL_float2,
                           X::cl.CL_mem, offx::Csize_t, incx::Cint,
                           Y::cl.CL_mem, offy::Csize_t, incy::Cint)
                           

@api2.blasfun clblasZaxpy(n::Csize_t, alpha::CL_double2,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                          n_queues::cl.CL_uint,
                          queues::Ptr{cl.CL_command_queue},
                          n_events_in_wait_list::cl.CL_uint,
                          event_wait_list::Ptr{cl.CL_event},
                          events::Ptr{cl.CL_event})

@api2.blasfun2 clblasZaxpy(n::Csize_t, alpha::CL_double2,
                           X::cl.CL_mem, offx::Csize_t, incx::Cint,
                           Y::cl.CL_mem, offy::Csize_t, incy::Cint)

