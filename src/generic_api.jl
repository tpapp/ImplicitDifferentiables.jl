#####
##### definition for a generic API
#####

"""
$(SIGNATURES)
"""
capabilities(f) = nothing

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
$(SIGNATURES)
"""
function random_position(rng::AbstractRNG, f)
    lift_coordinates(f, randn(rng, coordinates_dimension(f)))
end

random_position(f) = random_position(GLOBAL_RNG, f)

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
