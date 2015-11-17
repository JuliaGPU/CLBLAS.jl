
for (func, typ) in [(:clblasSgemv, cl.CL_float),
                    (:clblasDgemv, cl.CL_double),
                    (:clblasCgemv, CL_float2),
                    (:clblasZgemv, CL_double2)]
    
    @eval @blasfun $func(order::clblasOrder, transA::clblasTranspose,
                              M::Csize_t, N::Csize_t,
                              alpha::$typ,
                              A::cl.CL_mem, offA::Csize_t, lda::Csize_t,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              beta::$typ,
                              y::cl.CL_mem, offy::Csize_t, incy::Cint,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(order::clblasOrder, transA::clblasTranspose,
                              M::Csize_t, N::Csize_t,
                              alpha::$typ,
                              A::cl.CL_mem, offA::Csize_t, lda::Csize_t,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              beta::$typ,
                              y::cl.CL_mem, offy::Csize_t, incy::Cint)
    
end
