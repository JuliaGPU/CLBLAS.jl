
# axpy
for typ in [Float32,
            Float64,
            # Complex64,
            Complex128]
    @eval begin
        T = $typ
        alpha = T(2.0)
        hx = rand(T, 32)        
        hy = rand(T, 32)
        x = CLArray(q, hx)
        y = CLArray(q, hy)

        cl.wait(axpy!(alpha, x, y; queue=q))
        axpy!(alpha, hx, hy)
        
        @assert isapprox(cl.to_host(y), hy)
    end
end

# scal
for typ in [Float32,
            Float64,
            # Complex64,
            Complex128]
    
    @eval begin
        n = 32
        DA = $typ(2.0)
        hDX = rand($typ, 32)
        DX = CLArray(q, hDX)
        incx = 1
        
        cl.wait(scal!(n, DA, DX, incx; queue=q))
        scal!(n, DA, hDX, incx)
        
        @assert isapprox(cl.to_host(DX), hDX)
    end
end

