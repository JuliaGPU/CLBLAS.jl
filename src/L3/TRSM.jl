
for (func, typ) in [(:clblasStrsm, cl.CL_float),
                    (:clblasDtrsm, cl.CL_double),
                    (:clblasCtrsm, CL_float2),
                    (:clblasZtrsm, CL_double2)]
    
    @eval @blasfun $func(order::clblasOrder, side::clblasSide,
                              uplo::clblasUplo, transA::clblasTranspose,
                              diag::clblasDiag,
                              M::Csize_t, N::Csize_t,
                              alpha::$typ,
                              A::cl.CL_mem, offA::Csize_t, lda::Csize_t,
                              B::cl.CL_mem, offB::Csize_t, ldb::Csize_t,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(order::clblasOrder, side::clblasSide,
                               uplo::clblasUplo, transA::clblasTranspose,
                               diag::clblasDiag,
                               M::Csize_t, N::Csize_t,
                               alpha::$typ,
                               A::cl.CL_mem, offA::Csize_t, lda::Csize_t,
                               B::cl.CL_mem, offB::Csize_t, ldb::Csize_t)
    
end
