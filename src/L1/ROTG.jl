
for func in [:clblasSrotg, :clblasDrotg, :clblasCrotg, :clblasZrotg]
    
    @eval @blasfun $func(CA::cl.CL_mem, offCA::Csize_t,
                              CB::cl.CL_mem, offCB::Csize_t,
                              C::cl.CL_mem, offC::Csize_t,
                              S::cl.CL_mem, offS::Csize_t,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(CA::cl.CL_mem, offCA::Csize_t,
                               CB::cl.CL_mem, offCB::Csize_t,
                               C::cl.CL_mem, offC::Csize_t,
                               S::cl.CL_mem, offS::Csize_t)
    
end
