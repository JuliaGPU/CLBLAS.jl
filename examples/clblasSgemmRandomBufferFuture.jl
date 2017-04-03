import CLBLAS
using OpenCL: cl

const clblas = CLBLAS
clblas.setup()
alpha = cl.cl_float(5)
beta = cl.cl_float(2)

device, context, queue = clblas.get_next_compute_context()
A = clblas.randBuf(8, 12; ctx=context, queue=queue)
B = clblas.randBuf(12, 24; ctx=context, queue=queue)
C = clblas.randBuf(8, 24; ctx=context, queue=queue)

matA = clblas.fetch(A)
matB = clblas.fetch(B)
matC = clblas.fetch(C)

data = (5.0*matA*matB) + (2.0*matC)
future = clblas.clblasSgemm(UInt32(0), UInt32(0), alpha, A, B, beta, C)

result = fetch(future)
println(result)
println("------------")
println(data)
for i in 1:length(data)
  Test.@test_approx_eq_eps result[i] data[i]  0.00001
end

info("success!")
clblas.teardown()
