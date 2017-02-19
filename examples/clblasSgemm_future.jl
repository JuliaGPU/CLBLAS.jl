import CLBLAS
using OpenCL: cl

const clblas = CLBLAS
clblas.setup()

alpha = cl.cl_float(5)
beta = cl.cl_float(2)
A = float32([1.0 2.0 3.0; 4.0 5.0 6.0])  #rand(Float32, 2, 3)
B = float32([1.0 2.0; 3.0 4.0; 5.0 6.0]) #rand(Float32, 3, 2)
C = float32([1.0 2.0; 3.0 4.0])#rand(Float32, 2, 2)

data = (5.0*A*B) + (2.0*C)

future = clblas.clblasSgemm(UInt32(0), UInt32(0), alpha, A, B, beta, C)

result = fetch(future)
println(result)
println("------------")
println(data)
@assert(result == data)
info("success!")

clblas.teardown()
