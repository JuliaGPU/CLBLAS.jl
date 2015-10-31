@api.blas_func(clblasCsscal, (Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasCsscal, (Csize_t, cl.CL_float, cl.CL_mem, Csize_t, Cint))

@api.blas_func(clblasZdscal, (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasZdscal, (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint))




@api2.blasfun clblasSscal(N::Csize_t, alpha::cl.CL_float,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          n_queues::cl.CL_uint,
                          queues::Ptr{cl.CL_command_queue},
                          n_events_in_wait_list::cl.CL_uint,
                          event_wait_list::Ptr{cl.CL_event},
                          events::Ptr{cl.CL_event})

@api2.blasfun2 clblasSaxpy(N::Csize_t, alpha::cl.CL_float,
                           X::cl.CL_mem, offx::Csize_t, incx::Cint)


@api2.blasfun clblasZsscal(N::Csize_t, alpha::CL_double2,
                          X::cl.CL_mem, offx::Csize_t, incx::Cint,
                          n_queues::cl.CL_uint,
                          queues::Ptr{cl.CL_command_queue},
                          n_events_in_wait_list::cl.CL_uint,
                          event_wait_list::Ptr{cl.CL_event},
                          events::Ptr{cl.CL_event})

@api2.blasfun2 clblasZsscal(N::Csize_t, alpha::CL_double2,
                           X::cl.CL_mem, offx::Csize_t, incx::Cint)
