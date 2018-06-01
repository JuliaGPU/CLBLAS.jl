@testset "CLBLAS.L2" begin
    @testset "CLBLAS gemv" begin
        for T in testtypes
            alpha = T(2.0)
            beta = T(0.0)
            hA = rand(T, 32, 32)
            hB = rand(T, 32)
            hC = rand(T, 32)
            A = CLArray(q, hA)
            B = CLArray(q, hB)
            C = CLArray(q, hC)
            cl.wait(gemv!('N', alpha, A, B, beta, C))
            gemv!('N', alpha, hA, hB, beta, hC)

            @test cl.to_host(C) ≈ hC
        end
    end

    @testset "CLBLAS gbmv" begin
        for T in testtypes
            alpha = T(2.0)
            beta = T(0.0)
            hA = rand(T, 4, 32)
            hB = rand(T, 32)
            m = 33
            hC = rand(T, m)
            A = CLArray(q, hA)
            B = CLArray(q, hB)
            C = CLArray(q, hC)
            cl.wait(gbmv!('N', m, 1, 2, alpha, A, B, beta, C))
            gbmv!('N', m, 1, 2, alpha, hA, hB, beta, hC)

            @test cl.to_host(C) ≈ hC
        end
    end
end
