
for func in [:clblasSrotm, :clblasDrotm]
    @eval @blasfun $func(N::Csize_t,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                              SPARAM::cl.CL_mem, offSparam::Csize_t,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})
    
    @eval @blasfun2 $func(N::Csize_t,
                               X::cl.CL_mem, offx::Csize_t, incx::Cint,
                               Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                               SPARAM::cl.CL_mem, offSparam::Csize_t)
end

