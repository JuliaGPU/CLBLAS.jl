
for (func, typ) in [(:clblasChpr, cl.CL_float),
                    (:clblasZhpr, cl.CL_double)]
    
    @eval @blasfun $func(order::clblasOrder, uplo::clblasUplo,
                              N::Csize_t,
                              alpha::$typ,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              AP::cl.CL_mem, offa::Csize_t,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})

    @eval @blasfun2 $func(order::clblasOrder, uplo::clblasUplo,
                               N::Csize_t,
                               alpha::$typ,
                               X::cl.CL_mem, offx::Csize_t, incx::Cint,
                               AP::cl.CL_mem, offa::Csize_t)
    
end
