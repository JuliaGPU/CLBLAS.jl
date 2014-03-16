require("OpenCL")

module CLBLAS

 # why there is a type assertion at context.jl line 38
   import OpenCL
   const cl = OpenCL

   include("util/enum.jl")
   include("constants.jl")
   include("api.jl")
   include("future.jl")

   include("L1/L1.jl")
   include("L2/L2.jl")
   include("L3/L3.jl")

   # setup function
   @api.blas_func(clblasSetup, ())

   #destroy
   @api.blas_func_no_ret(clblasTeardown, ())

   global compute_context_holder = Array(Tuple, 0)
   global next_compute_context = -1
   global setup_called = false

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

   function setup()
       if isempty(cl.platforms())
           throw(cl.OpenCLException("No OpenCL.Platform available"))
       end

       gpu_devices = cl.devices(:gpu)
       if isempty(gpu_devices)
           throw(cl.OpenCLException("Unable to create any OpenCL.Context, no available devices"))
       end
       if !isempty(gpu_devices)
           for dev in gpu_devices
               local ctx::cl.Context
               local queue::cl.CmdQueue
               try
                   ctx = cl.Context(dev, properties=nothing, callback=supress_context_error)
                   queue  = cl.CmdQueue(ctx)
                   push!(compute_context_holder, (dev, ctx, queue))
               catch err
                   error(err)
               end
           end
       end
       if isempty(compute_context_holder)
           throw(cl.OpenCLException("Unable to create any OpenCL.Context, not worked..."))
       end
       #initializing clblas
       clblasSetup()
   end

   function teardown()
      clblasTeardown()
      release!(compute_context_holder)
      global compute_context_holder = Array(Tuple, 0)
      global next_compute_context = -1
      global setup_called = false
      return nothing
   end

   function release!(compute_context_holder::Vector{Tuple})
       for (dev, ctx, queue) in compute_context_holder
           try
              cl.release!(queue)
              cl.release!(ctx)
           catch err
              println(err)
              continue
           end
       end
   end
end # module
