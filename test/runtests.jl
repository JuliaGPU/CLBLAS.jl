module TestCLBLAS
using Base.Test

using OpenCL: cl
import OpenCL.cl.CLArray
using CLBLAS

CLBLAS.setup()
dev, ctx, q = cl.create_compute_context()
const testtypes = (Float32, Float64)
include("test_l1.jl")
include("test_l2.jl")
include("test_l3.jl")

end
