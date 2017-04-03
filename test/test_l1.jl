@testset "CLBLAS.L1" begin
    @testset "CLBLAS axpy" begin
        for T in testtypes
            alpha = T(2.0)
            hx = rand(T, 32)
            hy = rand(T, 32)
            x = CLArray(q, hx)
            y = CLArray(q, hy)

            cl.wait(axpy!(alpha, x, y; queue = q))
            axpy!(alpha, hx, hy)

            @test cl.to_host(y) ≈ hy
        end
    end

    @testset "CLBLAS scal" begin
        for T in [Float32,
                  Float64,
                  # Complex64,
                  Complex128]

            n = 32
            DA = T(2.0)
            hDX = rand(T, 32)
            DX = CLArray(q, hDX)
            incx = 1

            cl.wait(scal!(n, DA, DX, incx; queue=q))
            scal!(n, DA, hDX, incx)

            @test cl.to_host(DX) ≈ hDX
        end
    end
end
