import ImplicitDifferentiables: capabilities, coordinates_dimension, lift_coordinates,
    random_position, translate_position, get_coordinates, value, value_and_gradient,
    explicit_wrapper
using Test

@testset "fallbacks" begin
    @test capabilities("a fish") ≡ nothing
end

@testset "explicit wrapper" begin
    v(x) = 0.5 * sum(abs2, x)
    vg(x) = v(x), x

    @testset "with gradient" begin
        f = explicit_wrapper(3; value = v, value_and_gradient = vg)
        x = randn(3)
        @test capabilities(f).gradient == true
        @test coordinates_dimension(f) == 3
        @test lift_coordinates(f, x) == x
        y = random_position(f)
        @test y isa Vector{Float64} && all(isfinite, y)
        Δ = randn(3)
        @test translate_position(f, x, Δ) == x .+ Δ
        @test get_coordinates(f, x) == x
        @test value(f, x) == v(x)
        @test value_and_gradient(f, x) == vg(x)
    end

    @testset "without gradient, with random position" begin
        z = zeros(3)
        f = explicit_wrapper(3; value = v, random_coordinates = _ -> z)
        @test capabilities(f).gradient == false
        @test_throws MethodError value_and_gradient(f, randn(3))
        @test random_position(f) == z
    end
end
