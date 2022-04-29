# ImplicitDifferentiables.jl

![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
[![build](https://github.com/tpapp/ImplicitDifferentiables.jl/workflows/CI/badge.svg)](https://github.com/tpapp/ImplicitDifferentiables.jl/actions?query=workflow%3ACI)
<!-- comment out codecov as this is currently an API package -->
<!-- [![codecov.io](http://codecov.io/github/tpapp/ImplicitDifferentiables.jl/coverage.svg?branch=master)](http://codecov.io/github/tpapp/ImplicitDifferentiables.jl?branch=master) -->
[![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://tpapp.github.io/ImplicitDifferentiables.jl/stable)
[![Documentation](https://img.shields.io/badge/docs-master-blue.svg)](https://tpapp.github.io/ImplicitDifferentiables.jl/dev)

When estimating models economics, *conceptually* they can be can be thought of as a mapping `f` from a set of parameters `p` to some outcome that is a real number, eg a log likelihood or a moment distance.

However, *technically* `f` may involve

1. A mapping from a vector of real numbers `c` that is mapped to `p`, so that one can use an unconstrained or constrained generic optimizer or MCMC algorithm.

2. Solving for some implicit quantity `y`, eg equlibrium prices, that satisfies an equation `g(y, p)`. This is usually costly and involves a numerical rootfinder.

This is a lightweight interface package that helps dealing with these situations. Please read the manual for details.

**The package is still experimental. Interface changes will respect [SemVer](https://semver.org/), but that's all.**
