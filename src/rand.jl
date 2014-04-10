import OpenCL
const cl = OpenCL

randSource = open(readall, joinpath(dirname(Base.source_path()), "rand.cl"))

kern_dict = Dict()
function randByCtx(ctx)
    kern = get(kern_dict, ctx, nothing)
    if(kern == nothing)

        # build the program and
        p = cl.Program(ctx, source=randSource)
        println(string("-I", joinpath(dirname(Base.source_path()), "../")))
        p = cl.build!(p, options=string("-I", joinpath(dirname(Base.source_path()), "../")))

        # construct a kernel object
        kern = cl.Kernel(p, RAND_FUNC)
        kern_dict[ctx] = kern
    end
    return kern
end



function randBuf(dims::Int...; ctx=nothing, queue=nothing)
    println(dims)
    if(ctx == nothing)
         device, ctx, queue = get_next_compute_context()
    end
    local dim = 1;
    for i=1:length(dims)
         dim *= dims[i]
    end

    kernel = randByCtx(ctx)

    seed = uint32(time_ns())
    cl.set_arg!(kernel, 1, seed)
    globalMem = cl.Buffer(Float32, ctx, :rw, dim)
    cl.set_arg!(kernel, 2, globalMem)

    evt = cl.enqueue_kernel(queue, kernel, dim, 4)

    return Future(ctx, queue, globalMem, evt)
end
