
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

