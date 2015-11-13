
for (func, typ) in [(:clblasCherk, cl.CL_float),
                    (:clblasZherk, cl.CL_double)]
    
    @eval @api2.blasfun $func(order::clblasOrder, uplo::clblasUplo,
                              trans::clblasTranspose,
                              N::Csize_t, K::Csize_t,
                              alpha::$typ,
                              A::cl.CL_mem, offa::Csize_t, lda::Csize_t,
                              beta::$typ,
                              C::cl.CL_mem, offc::Csize_t, ldc::Csize_t,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @api2.blasfun2 $func(order::clblasOrder, uplo::clblasUplo,
                               trans::clblasTranspose,
                               N::Csize_t, K::Csize_t,
                               alpha::$typ,
                               A::cl.CL_mem, offa::Csize_t, lda::Csize_t,
                               beta::$typ,
                               C::cl.CL_mem, offc::Csize_t, ldc::Csize_t)
    
end
