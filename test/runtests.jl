module TestCLBLAS
  using FactCheck
  using Base.Test

  import OpenCL.cl
  import OpenCL.cl.CLArray
  using CLBLAS

  FactCheck.onlystats(true)

  CLBLAS.setup()
  dev, ctx, q = cl.create_compute_context()

  include("test_l1.jl")
  include("test_l3.jl")

  FactCheck.exitstatus()
end
