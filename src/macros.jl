
function parse_fun_expr(ex)
    if !(ex.head == :call)
        throw(ArgumentError("Invalid macro function definition"))
    end
    f_name = ex.args[1]
    vars = Symbol[]
    types = Union{Symbol,Expr,DataType}[]
    for var_ex in ex.args[2:end]
        if isa(var_ex, Expr) && var_ex.head == :(::)
            sym = var_ex.args[1]::Symbol
            typ = var_ex.args[2]::Union{Symbol,Expr,DataType}
        elseif isa(var_ex, Symbol)
            sym = var_ex
            typ = :Any
        else
            throw(ArgumentError("Can't parse variable list in " *
                                "macro function defintion"))
        end
        push!(vars, sym)
        push!(types, typ)
    end
    return f_name, vars, types
end


"""
Macro for calling CLBLAS C API functions. Usage example:

    @api2.blasfun clblasSaxpy(n::Csize_t, alpha::CL_float2,
                        X::cl.CL_mem, offx::Csize_t, incx::Cint,
                        Y::cl.CL_mem, offy::Csize_t, incy::Cint,
                        n_queues::cl.CL_uint,
                        queues::Ptr{cl.CL_command_queue},
                        n_events_in_wait_list::cl.CL_uint,
                        event_wait_list::Ptr{cl.CL_event},
                        events::Ptr{cl.CL_event})

Note: All parameter types are resolved in a macro definition environment,
      so only OpenCL types (e.g. cl.CL_float), CL_float2 and CL_double2
      are currently supported (which is essentially enough for wrapping
      CLBLAS C API)
"""
macro blasfun(expr)
    f, args, types = parse_fun_expr(expr)
    ex = Expr(:function)
    ex_fun = Expr(:(call))
    push!(ex_fun.args, f)
    for (arg, typ) in zip(args, types)
        # widen type for numbers (Int32 -> Integer)
        # let ccall handle these conversions!
        T = eval(typ)
        typ = if T <: Integer
            :Integer
        elseif contains(string(typ), "Ptr") # pointer should be handled by ccall as well
            :Any
        else
            typ
        end

        push!(ex_fun.args, :($arg::$typ))
    end
    push!(ex.args, ex_fun)

    ex_body = quote
        local err::cl.CL_int = ccall(($(string(f)), libCLBLAS),
                                     cl.CL_int,
                                     ($(map(eval, types)...),),
                                     $(args...))
        if err != cl.CL_SUCCESS
            println(STDERR, "Calling function $($(f)) failed!")
            throw(cl.CLError(err))
        end
        return err
    end

    push!(ex.args, ex_body)
    return esc(ex)
end


function kw_param_expr(name, dtype, value)
    Expr(:parameters, Expr(:kw, Expr(:(::), name, dtype), value))
end


"""
Shorter version of @blasfun with reduced number of parameters
"""
macro blasfun2(expr)
    f, args, types = parse_fun_expr(expr)
    ex = Expr(:function)
    ex_fun = Expr(:(call))
    push!(ex_fun.args, f)
    # optional list of events (kw args should go first in AST)
    push!(ex_fun.args,
          kw_param_expr(:inEvents, Vector{cl.CL_event}, cl.CL_event[]))
    # passed parameters
    for (arg, typ) in zip(args, types)
        var_ex = Expr(:(::))
        push!(var_ex.args, arg)
        push!(var_ex.args, typ)
        push!(ex_fun.args, var_ex)
    end
    # additional argument - list of queues
    push!(ex_fun.args, Expr(:(::), :inQueues, Vector{cl.CmdQueue}))
    push!(ex.args, ex_fun)

    ex_body = quote
        local ctx = cl.info(inQueues[1], :context)
        local num_queues = cl.CL_uint(length(inQueues))
        local queues = cl.CL_command_queue[queue.id for queue in inQueues]
        local num_events = cl.CL_uint(length(inEvents))
        local events = num_events == 0 ? C_NULL : Ref(inEvents)
        local ret_event = Ref{cl.CL_event}()

        # local err = $f($(args...), num_queues, pointer(queues), num_events,
        #                pointer(events), pointer(ret_event))
        local err::cl.CL_int = ccall(($(string(f)), libCLBLAS),
                                     cl.CL_int,
                                     ($(map(eval, types)...),
                                      # common types
                                      Cuint, Ptr{cl.CL_command_queue},
                                      Cuint, Ptr{cl.CL_event},
                                      Ptr{cl.CL_event},),
                                     $(args...),
                                     # common params
                                     num_queues, Ref(queues),
                                     num_events, events,
                                     ret_event)
        if err != cl.CL_SUCCESS
            throw(cl.CLError(err))
        end
        return cl.Event(ret_event[], retain=false)
    end

    push!(ex.args, ex_body)
    return esc(ex)
end
