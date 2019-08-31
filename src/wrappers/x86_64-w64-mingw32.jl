# Autogenerated wrapper script for FreeType2_jll for x86_64-w64-mingw32
export libfreetype

using Bzip2_jll
using Zlib_jll
## Global variables
const PATH_list = String[]
const LIBPATH_list = String[]
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `libfreetype`
const libfreetype_splitpath = ["bin", "libfreetype.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libfreetype_path = ""

# libfreetype-specific global declaration
# This will be filled out by __init__()
libfreetype_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libfreetype = "libfreetype.dll"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list

    append!(PATH_list, Bzip2_jll.PATH_list)
    append!(LIBPATH_list, Bzip2_jll.LIBPATH_list)
    append!(PATH_list, Zlib_jll.PATH_list)
    append!(LIBPATH_list, Zlib_jll.LIBPATH_list)
    global libfreetype_path = abspath(joinpath(artifact"FreeType2", libfreetype_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libfreetype_handle = dlopen(libfreetype_path)
    push!(LIBPATH_list, dirname(libfreetype_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

