CLBLAS.jl
============

*Support for compiling and executing native Julia kernels on CUDA hardware.*

**Build status**: [![][gitlab-img]][gitlab-url]

[gitlab-img]: https://gitlab.com/JuliaGPU/CLBLAS.jl/badges/master/pipeline.svg
[gitlab-url]: https://gitlab.com/JuliaGPU/CLBLAS.jl/pipelines



AMD clBLAS bindings for Julia.

## Installation notes

if the download of the binary fails on linux, you may also try to install clblas with `sudo apt-get install libclblas-dev` 
and then rerun `Pkg.build("CLBLAS")`.

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
