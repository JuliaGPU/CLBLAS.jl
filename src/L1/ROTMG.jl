
for func in [:clblasSrotmg, :clblasDrotmg]
    @eval @blasfun $func(SD1::cl.CL_mem, offSD1::Csize_t,
                              SD2::cl.CL_mem, offSD2::Csize_t,
                              SX1::cl.CL_mem, offSX1::Csize_t,
                              SY1::cl.CL_mem, offSY1::Csize_t,
                              SPARAM::cl.CL_mem, offSparam::Csize_t,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(SD1::cl.CL_mem, offSD1::Csize_t,
                               SD2::cl.CL_mem, offSD2::Csize_t,
                               SX1::cl.CL_mem, offSX1::Csize_t,
                               SY1::cl.CL_mem, offSY1::Csize_t,
                               SPARAM::cl.CL_mem, offSparam::Csize_t)
end
