facts("CLBLAS.L1") do
    context("CLBLAS axpy") do
        for T in [Float32,
                  Float64,
                  # Complex64,
                  Complex128]
            alpha = T(2.0)
            hx = rand(T, 32)
            hy = rand(T, 32)
            x = CLArray(q, hx)
            y = CLArray(q, hy)

            cl.wait(axpy!(alpha, x, y; queue = q))
            axpy!(alpha, hx, hy)

            @fact cl.to_host(y) --> roughly(hy)
        end
    end

    context("CLBLAS scal") do
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

            @fact cl.to_host(DX) --> roughly(hDX)
        end
    end
end
