# Autogenerated wrapper script for libpolymake_julia_jll for x86_64-linux-gnu-cxx11
export libpolymake_julia, polymake_run_script

using libcxxwrap_julia_jll
using polymake_jll
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


# Relative path to `polymake_run_script`
const polymake_run_script_splitpath = ["bin", "polymake_run_script"]

# This will be filled out by __init__() for all products, as it must be done at runtime
polymake_run_script_path = ""

# polymake_run_script-specific global declaration
function polymake_run_script(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(polymake_run_script_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"libpolymake_julia")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (libcxxwrap_julia_jll.PATH_list, polymake_jll.PATH_list, CompilerSupportLibraries_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (libcxxwrap_julia_jll.LIBPATH_list, polymake_jll.LIBPATH_list, CompilerSupportLibraries_jll.LIBPATH_list,))

    global libpolymake_julia_path = normpath(joinpath(artifact_dir, libpolymake_julia_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libpolymake_julia_handle = dlopen(libpolymake_julia_path)
    push!(LIBPATH_list, dirname(libpolymake_julia_path))

    global polymake_run_script_path = normpath(joinpath(artifact_dir, polymake_run_script_splitpath...))

    push!(PATH_list, dirname(polymake_run_script_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')
end  # __init__()

