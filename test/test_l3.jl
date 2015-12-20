
# gemm
for typ in [Float32,
            Float64,
            # Complex64,
            Complex128]
    @eval begin
        T = $typ
        alpha = T(2.0)
        beta = T(0.0)
        hA = rand(T, 64, 32)        
        hB = rand(T, 32, 64)
        hC = rand(T, 64, 64)
        A = CLArray(q, hA)
        B = CLArray(q, hB)
        C = CLArray(q, hC)
        
        cl.wait(gemm!('N', 'N', alpha, A, B, beta, C; queue=q))
        gemm!('N', 'N', alpha, hA, hB, beta, hC)
        
        @assert isapprox(cl.to_host(C), hC)
    end
end
