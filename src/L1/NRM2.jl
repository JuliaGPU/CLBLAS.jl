@api.blas_func(clblasSnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasSnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasDnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasDnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasScnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasScnrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))

@api.blas_func(clblasDznrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem,
                             cl.CL_uint, Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
                             Ptr{cl.CL_event}))

@api.blas_func2(clblasDznrm2, (Csize_t, cl.CL_mem, Csize_t, cl.CL_mem, Csize_t, Cint, cl.CL_mem))



for func in [:clblasSnrm2, :clblasDnrm2, :clblasScnrm2, :clblasDznrm2]
    @eval @api2.blasfun $func(N::Csize_t, NRM2::cl.CL_mem, offNRM2::Csize_t,
                              X::cl.CL_mem, offx::Csize_t, incx::Cint,
                              scratch_buff::cl.CL_mem,
                              n_queues::cl.CL_uint,
                              queues::Ptr{cl.CL_command_queue},
                              n_events_in_wait_list::cl.CL_uint,
                              event_wait_list::Ptr{cl.CL_event},
                              events::Ptr{cl.CL_event})
    @eval @api2.blasfun2 $func(N::Csize_t, NRM2::cl.CL_mem, offNRM2::Csize_t,
                               X::cl.CL_mem, offx::Csize_t, incx::Cint,
                               scratch_buff::cl.CL_mem)
end
