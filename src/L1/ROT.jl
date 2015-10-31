
@api2.blasfun clblasSrot(N::Csize_t,
                         X::cl.CL_mem, offx::Csize_t, incx::Cint,
                         Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                         C::cl.CL_float, S::cl.CL_float,
                         n_queues::cl.CL_uint,
                         queues::Ptr{cl.CL_command_queue},
                         n_events_in_wait_list::cl.CL_uint,
                         event_wait_list::Ptr{cl.CL_event},
                         events::Ptr{cl.CL_event})
                         
@api2.blasfun2 clblasSrot(N::Csize_t,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                          C::cl.CL_float, S::cl.CL_float)
                          

@api2.blasfun clblasDrot(N::Csize_t,
                         X::cl.CL_mem, offx::Csize_t, incx::Cint,
                         Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                         C::cl.CL_double, S::cl.CL_double,
                         n_queues::cl.CL_uint,
                         queues::Ptr{cl.CL_command_queue},
                         n_events_in_wait_list::cl.CL_uint,
                         event_wait_list::Ptr{cl.CL_event},
                         events::Ptr{cl.CL_event})

@api2.blasfun2 clblasDrot(N::Csize_t,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                          C::cl.CL_double, S::cl.CL_double)
                          
@api2.blasfun clblasCsrot(N::Csize_t,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                          C::cl.CL_float, S::cl.CL_float,
                          n_queues::cl.CL_uint,
                          queues::Ptr{cl.CL_command_queue},
                          n_events_in_wait_list::cl.CL_uint,
                          event_wait_list::Ptr{cl.CL_event},
                          events::Ptr{cl.CL_event})
                         
@api2.blasfun2 clblasCrot(N::Csize_t,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                          C::cl.CL_float, S::cl.CL_float)


@api2.blasfun clblasZdrot(N::Csize_t,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                          C::cl.CL_double, S::cl.CL_double,
                          n_queues::cl.CL_uint,
                          queues::Ptr{cl.CL_command_queue},
                          n_events_in_wait_list::cl.CL_uint,
                          event_wait_list::Ptr{cl.CL_event},
                          events::Ptr{cl.CL_event})

@api2.blasfun2 clblasZdrot(N::Csize_t,
                           X::cl.CL_mem, offx::Csize_t, incx::Cint,
                           Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                           C::cl.CL_double, S::cl.CL_double)

