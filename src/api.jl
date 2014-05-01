module api

import OpenCL
const cl = OpenCL

const libCLBLAS = "libclBLAS"

   macro blas_func(func, arg_types)
        local args_in = Symbol[symbol("arg$i::$T")
                               for (i, T) in enumerate(arg_types.args)]
        quote
            function $(esc(func))($(args_in...))
                local err::cl.CL_int = ccall(($(string(func)), libCLBLAS),
                                                cl.CL_int,
                                                $arg_types,
                                                $(args_in...))
                 if err != cl.CL_SUCCESS
                    throw(cl.CLError(err))
                 end
                 return err
             end
        end
   end
   macro blas_func2(func, arg_types)

        local args_in = Symbol[symbol("arg$i::$T")
                               for (i, T) in enumerate(arg_types.args)]

        quote
            function $(esc(func))($(args_in...), inQueues::Vector{cl.CmdQueue}, inEvents::Union(Vector{cl.CL_event}, Nothing)=nothing)
                local ctx = cl.info(inQueues[1], :context)
                local num_queues = length(inQueues)
                
                local num_events = cl.cl_uint(0)
                local events = C_NULL
                if (inEvents != nothing)
                    num_events = cl.cl_uint(length(inEvents))
                    events = inEvents
                end 
                
                local queues = Ptr[ queue.id for queue in inQueues]
                
                local event = cl.UserEvent(ctx, retain=true)
                local ptrEvent = [event.id]
                local err::cl.CL_int = $(esc(func))($(args_in...), num_queues, queues, num_events, events, ptrEvent)
                if err != cl.CL_SUCCESS
                   throw(cl.CLError(err))
                end
                ptrEvent
             end
        end
   end

   macro blas_func_no_ret(func, arg_types)
        local args_in = Symbol[symbol("arg$i::$T")
                               for (i, T) in enumerate(arg_types.args)]
        quote
            function $(esc(func))($(args_in...))
                ccall(($(string(func)), libCLBLAS),
                                                cl.CL_int,
                                                $arg_types,
                                                $(args_in...))
             end
        end
   end

   function check(err)
       if err != cl.CL_SUCCESS
            throw(cl.CLError(err))
       end
   end

end


