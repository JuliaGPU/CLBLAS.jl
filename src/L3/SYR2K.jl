
for (func, typ) in [(:clblasSsyr2k, cl.CL_float),
                    (:clblasDsyr2k, cl.CL_double),
                    (:clblasCsyr2k, CL_float2),
                    (:clblasZsyr2k, CL_double2)]
    
    @eval @blasfun $func(order::clblasOrder, uplo::clblasUplo,
                              transAB::clblasTranspose,
                              N::Csize_t, K::Csize_t,
                              alpha::$typ,
                              A::cl.CL_mem, offA::Csize_t, lda::Csize_t,
                              B::cl.CL_mem, offB::Csize_t, ldb::Csize_t,
                              beta::$typ,
                              C::cl.CL_mem, offC::Csize_t, ldc::Csize_t,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(order::clblasOrder, uplo::clblasUplo,
                               transAB::clblasTranspose,
                               N::Csize_t, K::Csize_t,
                               alpha::$typ,
                               A::cl.CL_mem, offA::Csize_t, lda::Csize_t,
                               B::cl.CL_mem, offB::Csize_t, ldb::Csize_t,
                               beta::$typ,
                               C::cl.CL_mem, offC::Csize_t, ldc::Csize_t)
    
end

