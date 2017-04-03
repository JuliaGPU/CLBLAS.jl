
import OpenCL.cl.CLArray
import Base.LinAlg.BLAS: axpy!, scal!, gemm!

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



########################### L2 functions ###############################



########################### L3 functions ###############################

## GEMM
for (func, typ) in [(:clblasSgemm, Float32), (:clblasDgemm, Float64),
                    (:clblasCgemm, CL_float2), (:clblasZgemm, CL_double2)]

    @eval function gemm!(tA::Char, tB::Char,
                         alpha::$typ, A::CLArray{$typ,2}, B::CLArray{$typ,2},
                         beta::$typ, C::CLArray{$typ,2};
                         queue=cl.queue(A))
        M = UInt64(size(A)[1])
        N = UInt64(size(B)[2])
        K = UInt64(size(A)[2])
        return $func(clblasColumnMajor, transval(tA), transval(tB), M, N, K,
              alpha, cl.pointer(A), UInt(0), M, cl.pointer(B), UInt(0), K,
              beta, cl.pointer(C), UInt(0), M, [queue])
    end

end


for (func, typ) in (
        (:clblasSgemv, Float32), (:clblasDgemv, Float64),
        (:clblasCgemv, CL_float2), (:clblasZgemv, CL_double2)
    )
    @eval begin
        function gemv!(
                trans::Char, alpha::($typ), A::CLArray{$typ, 2},
                X::CLArray{$typ, 1}, beta::($typ), Y::CLArray{$typ, 1}
            )
            event = Ref{cl.CL_event}()
            M, N = size(A, 1), size(A, 2)
            $func(
                clblasColumnMajor, transval(trans),
                M, N,
                alpha,
                cl.pointer(A), 0, M,
                cl.pointer(X), 0, 1,
                beta,
                cl.pointer(Y), 0, 1,
                1, Base.RefValue(A.queue.id),
                0, C_NULL, # event_wait_list
                event
            )
            cl.Event(event[], retain = false)
        end
    end
end
