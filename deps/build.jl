using BinDeps
using Compat

@BinDeps.setup
libnames = ["libCLBLAS", "clBLAS", "libclBLAS"]
libCLBLAS = library_dependency("libCLBLAS", aliases = libnames)
baseurl = "https://github.com/clMathLibraries/clBLAS/releases/download/v2.12/clBLAS-2.12.0-"

# download a pre-compiled binary (built by GLFW)
if is_windows()
    if Sys.ARCH == :x86_64
        uri = URI(baseurl * "Windows-x64.zip")
        basedir = joinpath(@__DIR__, "package")
        provides(
            Binaries, uri,
            libCLBLAS, unpacked_dir = basedir,
            installed_libpath = joinpath(basedir, "bin"), os = :Windows
        )
    else
        error("Only 64 bits windows supported with automatic build")
    end
end

if is_linux()
    if Sys.ARCH == :x86_64
        push!(BinDeps.defaults, Binaries)
        uri = URI(baseurl * "Linux-x64.tar.gz")
        basedir = joinpath(@__DIR__, "package")
        provides(
            Binaries, uri,
            libCLBLAS, unpacked_dir = basedir,
            installed_libpath = joinpath(basedir, "lib64"), os = :Linux
        )
    end
    provides(AptGet, "libclblas-dev", libCLBLAS)
end

if is_apple()
    error("""
        OSX not oficially supported.
        Find manual build instructions on: https://github.com/clMathLibraries/clBLAS/wiki/Build
    """)
end

@BinDeps.install Dict("libCLBLAS" => "libCLBLAS")

is_linux() && Sys.ARCH == :x86_64 && pop!(BinDeps.defaults)
