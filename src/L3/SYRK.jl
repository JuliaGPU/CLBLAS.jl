
for (func, typ) in [(:clblasSsyrk, cl.CL_float),
                    (:clblasDsyrk, cl.CL_double),
                    (:clblasCsyrk, CL_float2),
                    (:clblasZsyrk, CL_double2)]
    
    @eval @api2.blasfun $func(order::clblasOrder, uplo::clblasUplo,
                              transA::clblasTranspose,
                              N::Csize_t, K::Csize_t,
                              alpha::$typ,
                              A::cl.CL_mem, offA::Csize_t, lda::Csize_t,
                              beta::$typ,
                              B::cl.CL_mem, offB::Csize_t, ldb::Csize_t,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @api2.blasfun2 $func(order::clblasOrder, uplo::clblasUplo,
                               transA::clblasTranspose,
                               N::Csize_t, K::Csize_t,
                               alpha::$typ,
                               A::cl.CL_mem, offA::Csize_t, lda::Csize_t,
                               beta::$typ,
                               B::cl.CL_mem, offB::Csize_t, ldb::Csize_t)
    
end
