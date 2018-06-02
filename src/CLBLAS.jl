__precompile__(true)
module CLBLAS

using OpenCL: cl

export axpy!, scal!, gemm!, gemv!, gbmv!

# why there is a type assertion at context.jl line 38
depsfile = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")
if isfile(depsfile)
    include(depsfile)
else
    error("CLBLAS not properly installed. Please run Pkg.build(\"CLBLAS\") then restart Julia.") # now that this is decoupled from images, should this be an error?
end

include("constants.jl")
include("macros.jl")

include("L1/L1.jl")
include("L2/L2.jl")
include("L3/L3.jl")

include("highlevel.jl")

function LocalMem(::Type{T}, len::Integer) where T
    @assert len > 0
    nbytes = sizeof(T) * len
    return LocalMem{T}(convert(Csize_t, nbytes))
end

# setup function
@blasfun clblasSetup()

#destroy
clblasTeardown() = ccall((:clblasTeardown, libCLBLAS), Void, ())

global compute_context_holder = []
global next_compute_context = -1
global clblas_initialized = false

function get_next_compute_context()
    global next_compute_context = next_compute_context + 1
    return get_next_compute_context(next_compute_context)
end

function get_next_compute_context(next_compute_context)
    return compute_context_holder[( next_compute_context % length(compute_context_holder)) + 1]
end

function supress_context_error(error_info, private_info)
    warn(error_info)
    return C_NULL
end

function setup(profile = false)
    if isempty(cl.platforms())
        throw(cl.OpenCLException("No OpenCL.Platform available"))
    end
    #TODO: osx only due to https://github.com/clMathLibraries/clBLAS/issues/25
    available_devices = is_apple() ? cl.devices(:gpu) : cl.devices()
    if isempty(available_devices)
        throw(cl.OpenCLException("Unable to create any OpenCL.Context, no available devices"))
    end
    if !isempty(available_devices)
        for dev in available_devices
            local ctx::cl.Context
            local queue::cl.CmdQueue
            try
                ctx = cl.Context(dev, properties=nothing, callback=supress_context_error)
                queue  = profile ? cl.CmdQueue(ctx, :profile) : cl.CmdQueue(ctx);
                push!(compute_context_holder, (dev, ctx, queue))
            catch err
                error(err)
            end
        end
    end
    if isempty(compute_context_holder)
        throw(cl.OpenCLException("Unable to create any OpenCL.Context, not worked..."))
    end
    return
end

function teardown()
    if clblas_initialized
        clblasTeardown()
    end
    global compute_context_holder = []
    global next_compute_context = -1
    global clblas_initialized = false
    return
end

function __init__()
    clblasSetup()
    global clblas_initialized = true
    atexit(teardown)
end

end # module
