
for (func, typ) in [(:clblasCsscal, cl.CL_float),
                    (:clblasZdscal, cl.CL_double)]
    
    @eval @api2.blasfun $func(N::Csize_t, alpha::$typ,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @api2.blasfun2 $func(N::Csize_t, alpha::$typ,
                               X::cl.CL_mem, offx::Csize_t, incx::Cint)
    
end
