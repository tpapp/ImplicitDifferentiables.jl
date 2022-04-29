#####
##### definition for a generic API
#####

"""
$(SIGNATURES)

Query whether a mapping `f` supports the API of this package.

If not, `nothing` should be returned.

If yes, an object with the following properties:

- `gradient::Bool`: true if `value_and_gradient` is supported
"""
capabilities(f) = nothing

"""
`$(FUNCTIONNAME)(f)`

Dimension of coordinates, as a positive integer.
"""
function coordinates_dimension end

####
#### position
####

"""
`$(FUNCTIONNAME)(f, x::AbstractVector)`

Convert coordinates `x` into a “position”. The inverse of [`get_coordinates`](@ref).
"""
function lift_coordinates end

"""
`$(FUNCTIONNAME)(f, p)`

Convert a *position* to *coordinates*. The inverse of [`lift_coordinates`](@ref).
"""
function get_coordinates end

"""
$(SIGNATURES)

Return a random position.
"""
function random_position(rng::AbstractRNG, f)
    lift_coordinates(f, randn(rng, coordinates_dimension(f)))
end

random_position(f) = random_position(GLOBAL_RNG, f)

"""
`$(FUNCTIONNAME)(f, p, Δ)`

Return `q` such that
```julia
get_coordinates(f, q) ≈ get_coordinates(f, p) .+ Δ
```
"""
function translate_position end

####
#### evaluation
####

"""
`$(FUNCTIONNAME)(f, p)`

Return the value of the mapping `f(p)`.
"""
function value end

"""
`$(FUNCTIONNAME)(f, p)`

Return a tuple of

1. `value(f, p)`

2. the gradient of `x -> value(f, lift_coordinates(f, x))` at `x = get_coordinates(f, p)`.
"""
function value_and_gradient end
