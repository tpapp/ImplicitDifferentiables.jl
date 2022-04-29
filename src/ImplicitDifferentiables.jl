"""
Placeholder for a short summary about ImplicitDifferentiables.
"""
module ImplicitDifferentiables

using DocStringExtensions: FUNCTIONNAME
using Random: AbstractRNG

"""
`$(FUNCTIONNAME)(f)`
"""
function is_implicit_differentiable end

"""
`$(FUNCTIONNAME)(f)`
"""
function coordinates_dimension end

####
#### position
####

"""
`$(FUNCTIONNAME)(f, x::AbstractVector)`
"""
function lift_coordinates end

"""
`$(FUNCTIONNAME)(f)`
"""
function random_position end

"""
`$(FUNCTIONNAME)(f, p, Δ)`
"""
function translate_position end

"""
`$(FUNCTIONNAME)(f, p)`
"""
function get_coordinates end

####
#### evaluation
####

"""
`$(FUNCTIONNAME)(f, p)`
"""
function value end

"""
`$(FUNCTIONNAME)(f, p)`
"""
function value_and_gradient end

end # module
