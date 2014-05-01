import OpenCL
const cl = OpenCL

type Future
   ctx::cl.Context
   queue::cl.CmdQueue
   mem::cl.Buffer
   #Dimensions are important to read the result back.
   dims::Tuple
   # Vector because we would like to keep the pointer around
   event::Union(Vector{cl.CL_event}, Nothing)
   # kept around for profiling
   actualEvent::Union(cl.CLEvent, Nothing)

   function Future{T}(ctx::cl.Context, queue::cl.CmdQueue, data::Array{T})
      #Sync call to create buffer
      mem = cl.Buffer(eltype(data), ctx, length(data))
      event = cl.enqueue_write_buffer(queue, mem, data,
                                      convert(Csize_t, sizeof(eltype(data))*length(data)),
                                      convert(Csize_t, 0), nothing,  false)
      dims = size(data)
      future = Future(ctx, queue, mem, dims, event)
      return future
   end

   function Future(ctx::cl.Context, queue::cl.CmdQueue, mem::cl.Buffer, dims::Tuple)
       event = cl.UserEvent(ctx)
       return Future(ctx, queue, mem, dims, event)
   end

   function Future(ctx::cl.Context, queue::cl.CmdQueue, mem::cl.Buffer, dims::Tuple, evt::cl.CLEvent)
       future = new(ctx, queue, mem, dims, [pointer(evt)], evt)
       return future
   end
end

function getEvents(futures::Future...)
    local events = [ future.event[1] for future in futures]
    local req_num_events = length(events)
    return (req_num_events, events)
end

function getEvents(futures::Array{Future, 1})
   local events = [ future.event[1] for future in futures]
   local req_num_events = length(events)
   return (req_num_events, events)
end

function first_future(futures::Union(Array, Future)...)
    for i in 1:length(futures)
        local future = futures[i]
        if typeof(future) == Future
            return future
        end
    end
    return nothing
end

function to_futures(inputs::Union(Array, Future)...)
    local ctx = nothing
    local queue = nothing
    local mem = nothing
    local number_of_elements = nothing

    reference_future = first_future(inputs...)
    if(reference_future == nothing)
        device, ctx, queue = get_next_compute_context()
    else
        ctx = reference_future.ctx
        queue = reference_future.queue
    end

    futures_length = length(inputs)
    futures = Array(Future, futures_length)
    for i in 1:futures_length
        local futureOrData = inputs[i]
        if typeof(futureOrData) == Future
            if ctx != futureOrData.ctx
                err("Context Move is required.")
            end
            futures[i] = futureOrData
        else
            # below future is actually data
            futures[i] = Future(ctx, queue, futureOrData)
        end
    end
    return futures
end


Base.fetch(future::Future) = begin
    result = zeros(eltype(future.mem), length(future.mem))
    cl.api.clWaitForEvents(cl.cl_uint(1), pointer(future.event))
    cl.enqueue_read_buffer(future.queue, future.mem, result, unsigned(0), nothing, true)
    return reshape(result, future.dims)
end
