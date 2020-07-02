# Autogenerated wrapper script for libpolymake_julia_jll for x86_64-linux-gnu-libstdcxx23-cxx11
export libpolymake_julia, type_translator

using libcxxwrap_julia_jll
using polymake_jll
using Perl_jll
using CompilerSupportLibraries_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libpolymake_julia`
const libpolymake_julia_splitpath = ["lib", "libpolymake_julia.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libpolymake_julia_path = ""

# libpolymake_julia-specific global declaration
# This will be filled out by __init__()
libpolymake_julia_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libpolymake_julia = "libpolymake_julia.so"


# Relative path to `type_translator`
const type_translator_splitpath = ["share", "libpolymake_julia", "type_translator.jl"]

# This will be filled out by __init__() for all products, as it must be done at runtime
type_translator_path = ""

# type_translator-specific global declaration
# This will be filled out by __init__()
type_translator = ""


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"libpolymake_julia")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (libcxxwrap_julia_jll.PATH_list, polymake_jll.PATH_list, Perl_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (libcxxwrap_julia_jll.LIBPATH_list, polymake_jll.LIBPATH_list, Perl_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list,))

    global libpolymake_julia_path = normpath(joinpath(artifact_dir, libpolymake_julia_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libpolymake_julia_handle = dlopen(libpolymake_julia_path, RTLD_GLOBAL)
    push!(LIBPATH_list, dirname(libpolymake_julia_path))

    global type_translator_path = normpath(joinpath(artifact_dir, type_translator_splitpath...))

    global type_translator = type_translator_path
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')
end  # __init__()

