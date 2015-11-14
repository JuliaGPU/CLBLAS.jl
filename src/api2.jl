module api2

# including CL_float2 and CL_double2 types
include("constants.jl")

import OpenCL
const cl = OpenCL


## @unix_only const libCLBLAS = "libclBLAS"
## @windows_only const libCLBLAS = "clBLAS"


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

_jl_type(t::Type) = t
_jl_type{T<:Integer}(t::Type{T}) = :Integer # any subclass of Integer should use the superclass instead
_jl_type(t::Type{cl.CL_float}) = :Real
_jl_type(t::Type{cl.CL_double}) = :Real
_jl_type(t::Type{CL_float2}) = :(Union{Real, Complex})
_jl_type(t::Type{CL_double2}) = :(Union{Real, Complex})
_jl_type(s::Union{Symbol,Expr}) = begin
    t = eval(s)
    t2 = _jl_type(t)
    t == t2 ? s : t2 # prefer original symbol/expression which retains use of typealiases, etc
end

_c_type(t::Type) = t
_c_type{T<:Enum}(t::Type{T}) = Cint

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
        var_ex = Expr(:(::))
        push!(var_ex.args, arg)
        push!(var_ex.args, _jl_type(typ))
        push!(ex_fun.args, var_ex)
    end
    push!(ex.args, ex_fun)

    c_types = map(_c_type, map(eval, types))
    ex_body = quote
        local err::cl.CL_int = ccall(($(string(f)), libCLBLAS),
                                     cl.CL_int,
                                     ($(map(eval, c_types)...),),
                                     $(args...))
        if err != cl.CL_SUCCESS
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
        push!(var_ex.args, _jl_type(typ))
        push!(ex_fun.args, var_ex)
    end
    # additional argument - list of queues
    push!(ex_fun.args, Expr(:(::), :inQueues, Vector{cl.CmdQueue}))
    push!(ex.args, ex_fun)

    ex_body = quote
        local ctx = cl.info(inQueues[1], :context)
        local num_queues = cl.CL_uint(length(inQueues))

        local num_events = cl.cl_uint(0)
        local events = Ptr{Void}[C_NULL]
        if (inEvents != [])
            num_events = cl.cl_uint(length(inEvents))
            events = inEvents
        end

        local queues = Ptr{Void}[queue.id for queue in inQueues]

        local event = cl.UserEvent(ctx, retain=true)
        local ptrEvent = Ptr{Void}[event.id]
        local err = $f($(args...), num_queues, pointer(queues), num_events,
                       pointer(events), pointer(ptrEvent))
        if err != cl.CL_SUCCESS
            throw(cl.CLError(err))
        end
        ptrEvent
    end

    push!(ex.args, ex_body)
    return esc(ex)
end


end
