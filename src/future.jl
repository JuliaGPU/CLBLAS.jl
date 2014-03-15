import OpenCL
const cl = OpenCL

type Future
   ctx::cl.Context
   queue::cl.CmdQueue
   resultMem::cl.Buffer
   events::Vector{Ptr{Void}}

   function Future(ctx::cl.Context, queue::cl.CmdQueue, resultMem::cl.Buffer)
       future = new(ctx, queue, resultMem, [(cl.UserEvent(ctx)).id])
       return future
   end
end

function find_compute_context(futures::Union(Vector, Future)...)
        local events = Array(Ptr{Void}, 0)
        local req_num_events = 0
        local ctx = nothing
        local queue = nothing
        local mem = nothing
        local number_of_elements = nothing

        for i in 1:length(futures)
            local future = futures[i]
            if typeof(future) == Future
                if ctx == nothing
                    ctx = future.ctx
                    queue = future.queue
                    mem = future.resultMem
                    number_of_elements = unsigned(length(future.resultMem))
                end
                if future.events != C_NULL
                   req_num_events += 1
                   push!(events, future.events[1])
                end
            end
        end
        if ctx == nothing
            device, ctx, queue = get_next_compute_context()
            mem = cl.Buffer(eltype(futures[1]), ctx, (:rw, :copy), hostbuf=futures[1])
            number_of_elements = convert(Csize_t, length(futures[1]))
        end
        return (ctx, queue, number_of_elements, mem, req_num_events,
                                                     req_num_events == 0 ? C_NULL : events)
end


Base.fetch(future::Future) = begin
    result = Array(eltype(future.resultMem), length(future.resultMem))
    cl.api.clWaitForEvents(cl.cl_uint(1), future.events)
    cl.enqueue_read_buffer(future.queue, future.resultMem, result, unsigned(0), nothing, true)
    return result
end
