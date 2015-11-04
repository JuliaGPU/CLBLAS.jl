
for (func, typ) in [(:clblasSspr2, cl.CL_float),
                    (:clblasDspr2, cl.CL_double)]
    
    @eval @api2.blasfun $func(order::clblasOrder, uplo::clblasUplo,
                              N::Csize_t,
                              alpha::$typ,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                              AP::cl.CL_mem, offa::Csize_t,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @api2.blasfun2 $func(order::clblasOrder, uplo::clblasUplo,
                               N::Csize_t,
                               alpha::$typ,
                               X::cl.CL_mem, offx::Csize_t, incx::Cint,
                               Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                               AP::cl.CL_mem, offa::Csize_t)
    
end
