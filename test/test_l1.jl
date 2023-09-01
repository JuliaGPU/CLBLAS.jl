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

    @testset "CLBLAS dot" begin
        for T in [Float32, Float64]

            n = 32
            x = rand(T, n)
            y = rand(T, n)
            x_cl = CLArray(q, x)
            y_cl = CLArray(q, y)
            incx = 1
            incy = 1

            res_true = dot(x, y)
            res_cl = dot(n, x_cl, incx, y_cl, incy, queue=q)

            @test res_cl ≈ res_true
        end
    end

    @testset "CLBLAS nrm2" begin
        for T in [Float32, Float64]

            n = 32
            x = rand(T, n)
            x_cl = CLArray(q, x)
            incx = 1

            res_true = norm(x)
            res_cl = CLBLAS.nrm2(n, x_cl, incx, queue=q)

            @test res_cl ≈ res_true
        end
    end
end
