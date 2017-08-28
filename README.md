CLBLAS.jl
============

**Build status**: [![][buildbot-julia05-img]][buildbot-julia05-url] [![][buildbot-julia06-img]][buildbot-julia06-url] [![][buildbot-travis-img]][buildbot-travis-url]

[buildbot-julia05-img]: http://ci.maleadt.net/shields/build.php?builder=CLBLAS-julia05-x86-64bit&name=julia%200.5
[buildbot-julia05-url]: http://ci.maleadt.net/shields/url.php?builder=CLBLAS-julia05-x86-64bit
[buildbot-julia06-img]: http://ci.maleadt.net/shields/build.php?builder=CLBLAS-julia06-x86-64bit&name=julia%200.6
[buildbot-julia06-url]: http://ci.maleadt.net/shields/url.php?builder=CLBLAS-julia06-x86-64bit
[buildbot-travis-img]: https://travis-ci.org/JuliaGPU/CLBLAS.jl.svg
[buildbot-travis-url]: https://travis-ci.org/JuliaGPU/CLBLAS.jl

AMD clBLAS bindings for Julia.

## Current status

 * Low-level bindings
 * Partial implementation of high-level API similar to `Base.LinAlg.BLAS`

## Example

```
using OpenCL
import OpenCL.cl.CLArray
import CLBLAS
const clblas = CLBLAS


clblas.setup()
device, ctx, queue = clblas.get_next_compute_context()
alpha = 1.0
beta = 0.0

hA = rand(5, 10)
hB = rand(10, 5)
A = CLArray(queue, hA)
B = CLArray(queue, hB)
C = cl.zeros(queue, 5, 5)

clblas.gemm!('N', 'N', alpha, A, B, beta, C)
hC = cl.to_host(C)
if isapprox(hC, hA * hB)
    info("Success!")
else
    error("Results diverged")
end
```

## Caveats

 * `Complex64`/`CL_float2` doesn't work by default. This is caused by some weird incompatibility between clang (default for Julia) and gcc (default for clBLAS), so the only way to fix it right now is to manually compile clBLAS using clang,
