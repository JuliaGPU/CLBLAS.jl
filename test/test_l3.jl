@testset "CLBLAS.L1" begin
    @testset "CLBLAS gemm" begin
        for T in testtypes
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

            @test cl.to_host(C) ≈ hC
        end
    end
end
