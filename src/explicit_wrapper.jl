####
#### wrapper for functions that are ℝⁿ → ℝ without implicit values
####

struct ExplicitWrapper{TVG,TV,TRC}
    n::Int
    value_and_gradient::TVG
    value::TV
    random_coordinates::TRC
end

function explicit_wrapper(n::Int;
                          value_and_gradient = nothing,
                          value = nothing,
                          random_coordinates = nothing)
    @argcheck((value_and_gradient ≠ nothing || value ≠ nothing),
              "Provide one of `value` or `value_and_gradient")
    @argcheck n ≥ 1
    ExplicitWrapper(n, value_and_gradient, value, random_coordinates)
end

function capabilities(f::ExplicitWrapper)
    (gradient = f.value_and_gradient ≠ nothing, )
end

coordinates_dimension(f::ExplicitWrapper) = f.n

function lift_coordinates(f::ExplicitWrapper, x::AbstractVector)
    @argcheck length(x) == f.n
    @argcheck all(isfinite, x)
    copy(x)
end

function translate_position(f::ExplicitWrapper, p::AbstractVector,
                            Δ::AbstractVector)
    @argcheck f.n == length(p) == length(Δ)
    @argcheck all(isfinite, Δ)
    p .+ Δ
end

get_coordinates(f, p::AbstractVector) = p

function random_position(rng::AbstractRNG, f::ExplicitWrapper)
    if f.random_coordinates ≡ nothing
        randn(rng, f.n)
    else
        f.random_coordinates(rng)
    end
end

function value(f::ExplicitWrapper, p::AbstractVector)
    if f.value ≢ nothing
        f.value(p)
    else
        first(f.value_and_gradient(p))
    end
end

function value_and_gradient(f::ExplicitWrapper, p)
    @argcheck f.value_and_gradient ≢ nothing MethodError
    f.value_and_gradient(p)
end
