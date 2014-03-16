macro blas_func1(func, arg_types)
     local T1 = arg_types.args[1]
     quote
         function $(esc(func))(arg1::$T1)
            println($(esc(func))(convert(Int32, arg1)))
         end
     end
end

macro blas_func2(func, arg_types)
 local param_types = Symbol[symbol("$T")
                        for (i, T) in enumerate(arg_types.args)]
      quote
          function $(esc(func))(arg1::$(param_types[1]), arg2::$(param_types[2]))
             local args = [arg1, arg2]
             for i in 1:2
               println(typeof(args[i]))
               if typeof(args[i]) <: Int
                  args[i] = *(args[i], args[i])
               end
             end
             println($(esc(func))(convert(Int32, args[1] + args[2] )))
          end
      end
 end
