using BinDeps
@BinDeps.setup
libnames = ["libCLBLAS", "clBLAS", "libclBLAS"]
libCLBLAS = library_dependency("libCLBLAS", aliases = libnames)
archive = "package"
libpath = "package/bin"
baseurl = "https://github.com/clMathLibraries/clBLAS/releases/download/v2.12/clBLAS-2.12.0-"

# download a pre-compiled binary (built by GLFW)
if is_windows()
    if Sys.ARCH == :x86_64
        uri = URI(baseurl * "Windows-x64.zip")
        provides(
            Binaries, uri,
            libCLBLAS, unpacked_dir = archive,
            installed_libpath = "usr/lib64", os = :Windows
        )
    else
        error("Only 64 bits windows supported with automatic build")
    end
end

if is_linux()

    if Sys.ARCH == :x86_64
        push!(BinDeps.defaults, Binaries)
        uri = URI(baseurl * "Linux-x64.tar.gz")
        basedir = joinpath(dirname(@__FILE__), "clBLAS-2.12.0-Linux-x64")
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
