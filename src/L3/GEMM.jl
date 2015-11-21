import OpenCL
const cl = OpenCL

for (func, typ) in [(:clblasSgemm, cl.CL_float),
                    (:clblasDgemm, cl.CL_double),
                    (:clblasCgemm, CL_float2),
                    (:clblasZgemm, CL_double2)]
    
    @eval @blasfun $func(order::clblasOrder,
                              transA::clblasTranspose, transB::clblasTranspose,
                              M::Csize_t, N::Csize_t, K::Csize_t,
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

    @eval @blasfun2 $func(order::clblasOrder,
                               transA::clblasTranspose, transB::clblasTranspose,
                               M::Csize_t, N::Csize_t, K::Csize_t,
                               alpha::$typ,
                               A::cl.CL_mem, offA::Csize_t, lda::Csize_t,
                               B::cl.CL_mem, offB::Csize_t, ldb::Csize_t,
                               beta::$typ,
                               C::cl.CL_mem, offC::Csize_t, ldc::Csize_t)
    
end

