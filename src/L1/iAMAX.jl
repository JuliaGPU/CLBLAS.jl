
for func in [:clblasiSamax, :clblasiDamax, :clblasiCamax, :clblasiZamax]
    @eval @blasfun $func(N::Csize_t,
                              iMax::cl.CL_mem, offiMax::Csize_t,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              scratch_buff::cl.CL_mem,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(N::Csize_t,
                               iMax::cl.CL_mem, offiMax::Csize_t,
                               X::cl.CL_mem, offx::Csize_t, incx::Cint,
                               scratch_buff::cl.CL_mem)
end
