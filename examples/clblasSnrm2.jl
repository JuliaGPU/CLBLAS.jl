import CLBLAS
using OpenCL: cl

const clblas = CLBLAS
clblas.setup()

device, ctx, queue = clblas.get_next_compute_context()

N = Unsigned(5)
data = Vector{Float32}(5)
data[1] = 1.1
data[2] = 2.22
data[3] = 3.333
data[4] = 4.4444
data[5] = 5.55555

bufX = cl.Buffer(Float32, ctx, (:r, :copy),hostbuf=data)

bufNRM2 = cl.Buffer(Float32, ctx, :w, 1)
scratchBuff = cl.Buffer(Float32, ctx, :rw, 2 * length(data))

offNRM2 = offx = Unsigned(0)
incx = cl.cl_int(1)
ncq = cl.cl_uint(1)
clq = queue.id
newl = cl.cl_uint(0)

event = cl.UserEvent(ctx, retain=true)
ptrEvent = [event.id]

clblas.clblasSnrm2( N, bufNRM2.id, offNRM2, bufX.id, offx, incx, scratchBuff.id, ncq, [clq], newl, C_NULL, ptrEvent);

cl.api.clWaitForEvents(cl.cl_uint(1), ptrEvent)

result = Vector{Float32}(1)
cl.enqueue_read_buffer(queue, bufNRM2, result, Unsigned(0), nothing, true)

expected = BLAS.nrm2(5, data, 1)
println(result)
println("------------")
println(expected)

try
    @assert(isapprox(norm(expected - result[1]), zero(Float32)))
    info("success!")
finally
    clblas.teardown()
end
