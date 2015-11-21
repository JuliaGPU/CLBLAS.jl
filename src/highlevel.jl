
import OpenCL.CLArray

#### common stuff

# TODO: is this conversion valid?
Base.convert(::Type{CL_float2}, x::Complex{Float32}) =
    CL_double2(real(x), imag(x))

Base.convert(::Type{CL_double2}, x::Complex{Float64}) =
    CL_double2(real(x), imag(x))


function transval(t::Char)
    return t == 'T' ? clblasTrans : clblasNoTrans
end


########################### L1 functions ###############################

## AXPY
for (func, typ) in [(:clblasSaxpy, Float32), (:clblasDaxpy, Float64),
                    (:clblasCaxpy, CL_float2), (:clblasZaxpy, CL_double2)]

    @eval function axpy!(alpha::$typ, x::CLArray{$typ,1}, y::CLArray{$typ,1};
                         queue=cl.queue(x))
        @assert length(x) == length(y) "x and y have different sizes"
        $func(Csize_t(length(x)), alpha,
                    bufptr(x), Csize_t(0), Cint(1),
                    bufptr(y), Csize_t(0), Cint(1), [queue])
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
        $func(clblasColumnMajor, transval(tA), transval(tB), M, N, K,
              alpha, cl.bufptr(A), UInt(0), M, cl.bufptr(B), UInt(0), K,
              beta, cl.bufptr(C), UInt(0), M, [queue])
    end
    
end
