"""
An interface for problems that are equivalent to ``ℝⁿ → ℝ`` mappings, but may involve
impicitly calculated quantities and use other representations for coordinates.

Please read the manual for details.
"""
module ImplicitDifferentiables

using ArgCheck: @argcheck
using DocStringExtensions: FUNCTIONNAME, SIGNATURES
using Random: AbstractRNG, GLOBAL_RNG

include("generic_api.jl")
include("explicit_wrapper.jl")

end # module
