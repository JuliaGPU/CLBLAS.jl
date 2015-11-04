
for (func, typ) in [(:clblasChemm, CL_float2),
                    (:clblasZhemm, CL_double2)]
    
    @eval @api2.blasfun $func(order::clblasOrder, side::clblasSide,
                              uplo::clblasUplo,
                              M::Csize_t, N::Csize_t,
                              alpha::$typ,
                              A::cl.CL_mem, offa::Csize_t, lda::Csize_t,
                              B::cl.CL_mem, offb::Csize_t, ldb::Csize_t,
                              beta::$typ,
                              C::cl.CL_mem, offc::Csize_t, ldc::Csize_t,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @api2.blasfun2 $func(order::clblasOrder, side::clblasSide,
                               uplo::clblasUplo,
                               M::Csize_t, N::Csize_t,
                               alpha::$typ,
                               A::cl.CL_mem, offa::Csize_t, lda::Csize_t,
                               B::cl.CL_mem, offb::Csize_t, ldb::Csize_t,
                               beta::$typ,
                               C::cl.CL_mem, offc::Csize_t, ldc::Csize_t)
    
end

