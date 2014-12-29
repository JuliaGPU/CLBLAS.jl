CLBLAS.jl
============

[![Build Status](https://travis-ci.org/JuliaGPU/CLBLAS.jl.svg)](https://travis-ci.org/JuliaGPU/CLBLAS.jl)

AMD clBLAS bindings for Julia and more… 

* What is available
    * Direct clBLAS bindings for L1, L2, L3 (examples/clblasSscal.jl and others)
    * clBLAS bindings with optional event inputs for L1, L2, L3 (examples/clblasSscal_alt.jl)

* What is on progress
    * clBLAS bindings for Julia BLAS interface by using Future/Event chaining. Progress can be seen in examples/clblasSscal_future.jl or below. Once all clBLAS L1, L2, L3 are defined with Future, another module will be added to override julia BLAS interface.

This package uses [OpenCL.jl](https://github.com/JuliaGPU/OpenCL.jl). 

**_Please feel free to send your suggestions._** 

* Usage Example - clblasSscal call to direct clBlas interface 
```	
	using CLBLAS
	const clblas = CLBLAS
        const cl = clblas.cl

	clblas.setup()
	# Convenient function to pull available Compute Units in round-robin fashion.
	device, ctx, queue = clblas.get_next_compute_context()
	
	N = unsigned(5)
	alpha = cl.cl_float(10)
	data = rand(Float32, 10)
	X = cl.Buffer(Float32, ctx, (:rw, :copy), hostbuf=data)
	
	offx = unsigned(0)
	incx = cl.cl_int(1)
	ncq = cl.cl_uint(1)
	clq = queue.id
	newl = cl.cl_uint(0)

	event = cl.UserEvent(ctx, retain=true)
	ptrEvent = [event.id]
	clblas.clblasSscal(N, alpha, X.id, offx, incx, ncq, [clq], newl, C_NULL, ptrEvent)
	cl.api.clWaitForEvents(cl.cl_uint(1), ptrEvent2)
	result = Array(Float32, length(X))
	cl.enqueue_read_buffer(queue, X, result, unsigned(0), nothing, true)
	println(result)
```   

* Usage Example - clblasSscal by using Future
```
	using CLBLAS
	const clblas = CLBLAS
	const cl = clblas.cl
	
	clblas.setup()
	
 	alpha = cl.cl_float(10)
	data = rand(Float32, 10)
	future = clblas.clblasSscal(data, alpha)
	result = fetch(future)
	println(result)	
```
* More example will be added.
