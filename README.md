CLBLAS.jl
============

[![Build Status](https://travis-ci.org/JuliaGPU/CLBLAS.jl.svg)](https://travis-ci.org/JuliaGPU/CLBLAS.jl)

AMD clBLAS bindings for Julia.

## Current status
 
 * Low-level bindings
 * Partial implementation of high-level API similar to `Base.LinAlg.BLAS`

## Example

```
import OpenCL.CLArray
import CLBLAS
const clblas = CLBLAS                                                                                                                                           
const cl = clblas.cl

clblas.setup()
device, ctx, queue = clblas.get_next_compute_context()
alpha = 1.0
beta = 0.0

hA = rand(5, 10)                                                                                                                                            
hB = rand(10, 5)
A = CLArray(ctx, hA; queue=queue)
B = CLArray(ctx, hB; queue=queue)
C = cl.zeros(queue, 5, 5)

clblas.gemm!('N', 'N', alpha, A, B, beta, C)
hC = cl.to_host(C)
if isapprox(hC, hA * hB)
    info("Success!")
else
    error("Results diverged")
end
```
