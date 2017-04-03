import OpenCL
using OpenCL: cl

const ARRAY_SIZE = 64
sum = Vector{Float32}(2)
data = Vector{Float32}(ARRAY_SIZE)
for i in 1:ARRAY_SIZE
   data[i] = i*1.0
end

device, ctx, queue = cl.create_compute_context()

# create opencl buffer objects
# copies to the device initiated when the kernel function is called
global_size = 8
local_size = 4
num_groups = global_size/local_size
inputBuffer = cl.Buffer(Float32, ctx, (:r, :copy), hostbuf=data)
sumBuffer = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=sum)

addNumbersSource = open(readall, "addNumbers.cl")
# build the program and construct a kernel object
p = cl.Program(ctx, source=addNumbersSource) |> cl.build!
#p = cl.build!(p, options="-w")
const KERNEL_FUNC = "add_numbers"
addNumbersKernel = cl.Kernel(p, KERNEL_FUNC)

LocalMem{T}(::Type{T}, len::Integer) = begin
    @assert len > 0
    nbytes = sizeof(T) * len
    return LocalMem{T}(convert(Csize_t, nbytes))
end

localBuffer = cl.LocalMem(Float32, local_size)
# call the kernel object with global size set to the size our arrays
addNumbersKernel[queue, (global_size,), (local_size,)](inputBuffer, localBuffer, sumBuffer)

# perform a blocking read of the result from the device
r = cl.read(queue, sumBuffer)

total = 0.0;
for j in 1:length(r)
     total += r[j]
end
actualTotal = (ARRAY_SIZE + 1) * ARRAY_SIZE / 2

println("Total:", total, " Expected:",actualTotal)
println("Norm:", norm(actualTotal - total))
# check to see if our result is what we expect!
if isapprox(norm(actualTotal - total), zero(Float32))
    info("Success!")
else
    error("Norm should be 0.0f")
end
