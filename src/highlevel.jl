
import OpenCL.cl.CLArray
import Base.LinAlg.BLAS: axpy!, scal!, gemm!, gemv!, gbmv!, dot, nrm2

#### common stuff

function transval(t::Char)
    return t == 'T' ? clblasTrans : clblasNoTrans
end


########################### L1 functions ###############################

## AXPY
for (func, typ) in [(:clblasSaxpy, Float32), (:clblasDaxpy, Float64),
                    (:clblasCaxpy, CL_float2), (:clblasZaxpy, CL_double2)]

    @eval function axpy!(
            alpha::$typ, x::CLArray{$typ,1}, y::CLArray{$typ,1};
            queue = cl.queue(x)
        )
        @assert length(x) == length(y) "x and y have different sizes"
        return $func(Csize_t(length(x)), alpha,
                     pointer(x), Csize_t(0), Cint(1),
                     pointer(y), Csize_t(0), Cint(1), [queue])
    end

end


## SCAL
for (func, typ) in [(:clblasSscal, Float32), (:clblasDscal, Float64),
                    (:clblasCscal, CL_float2), (:clblasZscal, CL_double2)]

    @eval function scal!(n::Integer, DA::$typ,
                         DX::CLArray{$typ}, incx::Integer;
                         queue=cl.queue(DX))
        return $func(Csize_t(n), DA,
                     pointer(DX), Csize_t(0), Cint(incx),
                     [queue])
    end

end

## DOT
for (func, typ) in [(:clblasSdot, Float32), (:clblasDdot, Float64)]

    @eval function dot(n::Integer,
                       x::CLArray{$typ}, incx::Integer,
                       y::CLArray{$typ}, incy::Integer;
                       queue = cl.queue(x))
        n = length(x)
        @assert n == length(y) "x and y have different sizes"

        # output and scratch buffer
        ctx = cl.context(queue)
        out = zeros($typ, 1)
        out_buffer = cl.Buffer($typ, ctx, (:rw, :copy), hostbuf=out)
        scratch_buffer = cl.Buffer($typ, ctx, :rw, 2n)

        event = $func(Csize_t(n),
            pointer(out_buffer), Csize_t(0),
            pointer(x), Csize_t(0), Cint(incx),
            pointer(y), Csize_t(0), Cint(incy),
            pointer(scratch_buffer), [queue])

        # wait for kernel and read return value
        cl.wait(event)
        cl.enqueue_read_buffer(queue, out_buffer, out, Csize_t(0), nothing, true)

        return first(out)
    end

end

## NRM2
for (func, typ) in [(:clblasSnrm2, Float32), (:clblasDnrm2, Float64)]

    @eval function nrm2(n::Integer,
                        x::CLArray{$typ}, incx::Integer;
                        queue = cl.queue(x))
        n = length(x)

        # output and scratch buffer
        ctx = cl.context(queue)
        out = zeros($typ, 1)
        out_buffer = cl.Buffer($typ, ctx, (:rw, :copy), hostbuf=out)
        scratch_buffer = cl.Buffer($typ, ctx, :rw, 2n)

        event = $func(Csize_t(n),
            pointer(out_buffer), Csize_t(0),
            pointer(x), Csize_t(0), Cint(incx),
            pointer(scratch_buffer), [queue])

        # wait for kernel and read return value
        cl.wait(event)
        cl.enqueue_read_buffer(queue, out_buffer, out, Csize_t(0), nothing, true)

        return first(out)
    end

end



########################### L2 functions ###############################



########################### L3 functions ###############################


blas_size(t::Char, M) = UInt64(size(M, t=='N' ? 1 : 2), size(M, t=='N' ? 2 : 1))


function _stride(a, i::Integer)
    if i > ndims(a)
        return length(a)
    end
    s = 1
    for n = 1:(i-1)
        s *= size(a, n)
    end
    return UInt64(s)
end
## GEMM
for (func, typ) in [(:clblasSgemm, Float32), (:clblasDgemm, Float64),
                    (:clblasCgemm, CL_float2), (:clblasZgemm, CL_double2)]

    @eval function gemm!(tA::Char, tB::Char,
                         alpha::$typ, A::CLArray{$typ,2}, B::CLArray{$typ,2},
                         beta::$typ, C::CLArray{$typ,2};
                         queue=cl.queue(A))

        M = UInt64(size(A, tA == 'N' ? 1 : 2))
        K = UInt64(size(A, tA == 'N' ? 2 : 1))
        N = UInt64(size(B, tB == 'N' ? 2 : 1))
        lda = max(1, _stride(A, 2))
        ldb = max(1, _stride(B, 2))
        ldc = max(1, _stride(C, 2))
        return $func(clblasColumnMajor, transval(tA), transval(tB), M, N, K,
              alpha, cl.pointer(A), UInt(0), lda, cl.pointer(B), UInt(0), ldb,
              beta, cl.pointer(C), UInt(0), ldc, [queue])
    end
end


for (func, typ) in (
        (:clblasSgemv, Float32), (:clblasDgemv, Float64),
        (:clblasCgemv, CL_float2), (:clblasZgemv, CL_double2)
    )
    @eval begin
        function gemv!(
                tA::Char, alpha::($typ), A::CLArray{$typ, 2},
                X::CLArray{$typ, 1}, beta::($typ), Y::CLArray{$typ, 1}
            )
            event = Ref{cl.CL_event}()
            M, N = UInt64.(size(A))
            lda = max(1, _stride(A, 2))
            incx = _stride(X, 1)
            incy = _stride(Y, 1)
            $func(
                clblasColumnMajor, transval(tA),
                M, N,
                alpha,
                cl.pointer(A), 0, lda,
                cl.pointer(X), 0, incx,
                beta,
                cl.pointer(Y), 0, incy,
                1, Base.RefValue(A.queue.id),
                0, C_NULL, # event_wait_list
                event
            )
            cl.Event(event[], retain = false)
        end
    end
end


for (func, typ) in (
        (:clblasSgbmv, Float32), (:clblasDgbmv, Float64),
        (:clblasCgbmv, CL_float2), (:clblasZgbmv, CL_double2)
    )
    @eval begin
        function gbmv!(
                tA::Char, m::Int, kl::Int, ku::Int, alpha::($typ), A::CLArray{$typ, 2},
                X::CLArray{$typ, 1}, beta::($typ), Y::CLArray{$typ, 1}
            )
            event = Ref{cl.CL_event}()
            N = UInt64(size(A,2))
            M = UInt64(m)
            KL = UInt64(kl)
            KU = UInt64(ku)
            lda = max(1, _stride(A, 2))
            incx = _stride(X, 1)
            incy = _stride(Y, 1)
            $func(
                clblasColumnMajor, transval(tA),
                M, N, KL, KU,
                alpha,
                cl.pointer(A), 0, lda,
                cl.pointer(X), 0, incx,
                beta,
                cl.pointer(Y), 0, incy,
                1, Base.RefValue(A.queue.id),
                0, C_NULL, # event_wait_list
                event
            )
            cl.Event(event[], retain = false)
        end
    end
end
