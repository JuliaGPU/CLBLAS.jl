facts("CLBLAS.L1") do
    context("CLBLAS gemm") do
        for T in [Float32,
                  Float64,
                  # Complex64,
                  Complex128]
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

            @fact cl.to_host(C) --> roughly(hC)
        end
    end
end
