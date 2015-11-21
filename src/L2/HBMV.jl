
for (func, typ) in [(:clblasChbmv, CL_float2),
                    (:clblasZhbmv, CL_double2)]
    
    @eval @blasfun $func(order::clblasOrder, uplo::clblasUplo,
                              N::Csize_t, K::Csize_t,
                              alpha::$typ,
                              A::cl.CL_mem, offa::Csize_t, lda::Csize_t,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              beta::$typ,
                              Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(order::clblasOrder, uplo::clblasUplo,
                               N::Csize_t, K::Csize_t,
                               alpha::$typ,
                               A::cl.CL_mem, offa::Csize_t, lda::Csize_t,
                               X::cl.CL_mem, offx::Csize_t, incx::Cint,
                               beta::$typ,
                               Y::cl.CL_mem, offy::Csize_t, incy::Cint)
    
end
