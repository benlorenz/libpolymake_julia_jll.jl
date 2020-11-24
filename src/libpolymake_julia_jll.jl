# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule libpolymake_julia_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("libpolymake_julia")
JLLWrappers.@generate_main_file("libpolymake_julia", UUID("4d8266f6-2b3b-57e3-ad7a-d431eaaac945"))
end  # module libpolymake_julia_jll
