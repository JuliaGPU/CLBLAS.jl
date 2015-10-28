
import OpenCL: CLArray, CLMatrix, CLVector
const cl = OpenCL
import CLBLAS: clblasColumnMajor, clblasNoTrans, clblasTrans
import CLBLAS: clblasDgemm, clblasDscal, clblasSscal

#gemm!(tA::Int64, tB::Int64, alpha::Float64, A::cl.Buffer, B::cl.Buffer,
#      beta::Float64, C::cl.Buffer) = nothing

# TODO: buffer(A).id => bufferptr(A)


function transval(t::Char)
    return t == 'T' ? clblasTrans.n : clblasNoTrans.n
end

function gemm!(queue::cl.CmdQueue, tA::Char, tB::Char, alpha::Float64,
               A::CLMatrix{Float64}, B::CLMatrix{Float64},
               beta::Float64, C::CLMatrix{Float64})
    # TODO: handle transposed arrays
    M = size(A)[1]
    N = size(B)[2]
    K = size(A)[2]
    clblasDgemm(clblasColumnMajor.n, transval(tA), transval(tB), M, N, K, 
                alpha, cl.bufptr(A), 0, M, cl.bufptr(B), 0, K, 
                beta, cl.bufptr(C), 0, M, [queue])
end


function main()
    device, ctx, queue = cl.create_compute_context()
    A = CLArray(ctx, rand(10, 20))
    B = CLArray(ctx, rand(20, 10))
    C = CLArray(ctx, zeros(10, 10))
    tA = 'N'
    tB = 'N'
    alpha = 1.0
    beta = 0.0



    types = (UInt32, UInt32, UInt32, UInt64, UInt64, UInt64, Float64,
             Ptr{Void}, UInt64, UInt64, Ptr{Void}, UInt64, UInt64, Float64,
             Ptr{Void}, UInt64, UInt64, OpenCL.cl_uint, Ptr{Ptr{Void}},
             UInt32, Ptr{Ptr{Void}}, Ptr{Ptr{Void}})
    event = cl.UserEvent(ctx, retain=true)
    ptrEvent = [event.id]
    args = Any[clblasColumnMajor.n, transval(tA), transval(tB), M, N, K, 
               alpha, cl.bufptr(A), 0, M, cl.bufptr(B), 0, K, 
               beta, cl.bufptr(C), 0, M, UInt32(1), [queue], UInt32(0),
               C_NULL, ptrEvent]
    func = "clblasDgemm"    
    ccall((func, "libclBLAS"), cl.CL_int, 
          (UInt32, UInt32, UInt32, UInt64, UInt64, UInt64, Float64,
             Ptr{Void}, UInt64, UInt64, Ptr{Void}, UInt64, UInt64, Float64,
             Ptr{Void}, UInt64, UInt64, OpenCL.cl_uint, Ptr{Ptr{Void}},
             UInt32, Ptr{Ptr{Void}}, Ptr{Ptr{Void}}),
          args...)
    
end




function main2()
    device, ctx, queue = cl.create_compute_context()
    v = cl.ones(ctx, 10)
    ccall(("clblasDscal", "libclBLAS"), cl.CL_int,
          (Csize_t, cl.CL_double, cl.CL_mem, Csize_t, Cint, cl.CL_uint,
           Ptr{cl.CL_command_queue}, cl.CL_uint, Ptr{cl.CL_event},
           Ptr{cl.CL_event}),
          UInt64(10), 2.0, cl.bufptr(v), UInt64(0), Int32(1), UInt32(0),
          Ptr(Ptr(queue.id)), 0, C_NULL, C_NULL)


    N = unsigned(5)
    alpha = cl.cl_double(2)
    # data = rand(Float32, 10)
    # X = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=data)
    A = cl.ones(Float64, ctx, 10)

    offx = UInt64(0)
    incx = cl.cl_int(1)
    ncq = cl.cl_uint(1)
    clq = queue.id
    newl = cl.cl_uint(0)

    event = cl.UserEvent(ctx, retain=true)
    ptrEvent = [event.id]
    clblasDscal(N, alpha, cl.bufptr(A), offx, incx, ncq, [clq], newl, C_NULL, ptrEvent)
    
    # clblasSscal(N, alpha, cl.bufptr(v), UInt32(0), ncq, [queue.id], newl,
    #             C_NULL, ptrEvent)

    
end



## clblasDscal(
##                 size_t N,
##                 cl_double alpha,
##                 cl_mem X,
##                 size_t offx,
##                 int incx,
##                 cl_uint numCommandQueues,
##                 cl_command_queue *commandQueues,
##                 cl_uint numEventsInWaitList,
##                 const cl_event *eventWaitList,
##                 cl_event *events);



## clblasStatus
## clblasDgemm(
##                 clblasOrder order,
##                 clblasTranspose transA,
##                 clblasTranspose transB,
##                 size_t M,
##                 size_t N,
##                 size_t K,
##                 cl_double alpha,
##                 const cl_mem A,
##                 size_t offA,
##                 size_t lda,
##                 const cl_mem B,
##                 size_t offB,
##                 size_t ldb,
##                 cl_double beta,
##                 cl_mem C,
##                 size_t offC,
##                 size_t ldc,
##                 cl_uint numCommandQueues,
##                 cl_command_queue *commandQueues,
##                 cl_uint numEventsInWaitList,
##                 const cl_event *eventWaitList,
##                 cl_event *events);
                
