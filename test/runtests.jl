
import OpenCL: CLArray
const cl = OpenCL
using CLBLAS


CLBLAS.setup()

dev, ctx, q = cl.create_compute_context()

include("test_l1.jl")

include("test_l3.jl")

println("Ok.")
