
for (func, typ) in [(:clblasSscal, cl.CL_float),
                    (:clblasDscal, cl.CL_double),
                    (:clblasCscal, CL_float2),
                    (:clblasZscal, CL_double2)]
    
    @eval @blasfun $func(N::Csize_t, alpha::CL_double2,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(N::Csize_t, alpha::CL_double2,
                               X::cl.CL_mem, offx::Csize_t, incx::Cint)
    
end
