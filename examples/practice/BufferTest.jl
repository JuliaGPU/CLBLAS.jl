using OpenCL

function testRelease()
   const cl = OpenCL
   function test()
       device, ctx, queue = cl.create_compute_context()
       local data = Array(Float32, 3)
       data[1] = 0.1
       data[2] = 0.22
       data[3] = 0.333

       local X = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=data)
       local result = Array(Float32, 3)
       cl.enqueue_read_buffer(queue, X, result, unsigned(0), nothing, true)
       println(data, "\n-----------\n", result)
       @assert(data == result)
   end

   try
      test()
      gc()
   catch err
      gc()
      throw(err)
   end
end
