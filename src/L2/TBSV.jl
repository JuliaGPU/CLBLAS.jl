for func in [:clblasStbsv, :clblasDtbsv, :clblasCtbsv, :clblasZtbsv]

    @eval @blasfun $func(order::clblasOrder, uplo::clblasUplo,
                              trans::clblasTranspose, diag::clblasDiag,
                              N::Csize_t, K::Csize_t,
                              A::cl.CL_mem, offa::Csize_t, lda::Csize_t,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(order::clblasOrder, uplo::clblasUplo,
                               trans::clblasTranspose, diag::clblasDiag,
                               N::Csize_t, K::Csize_t,
                               A::cl.CL_mem, offa::Csize_t, lda::Csize_t,
                               X::cl.CL_mem, offx::Csize_t, incx::Cint)

end
