# Numerical Integration

Functions for numerical integration using Trapezoidal, Gauss-Legendre,
and Gauss-Kronrod methods.

**Trapezoidal Quadrature:** Calculates the integral of a function \\f\\
using the trapezoidal rule. If the integrand is periodic and integrated
over a full period, the trapezoidal rule converges faster than any power
of the step size \\h\\ (exponential convergence). For non-periodic twice
continuously differentiable functions, the error is \\O(h^2)\\. Checks
for convergence by halving the interval until the tolerance is met or
`max_refinements` is reached. Useful for periodic functions, bump
functions, and bell-shaped integrals over infinite intervals.

**Gauss-Legendre Quadrature:** Performs "one-shot" non-adaptive
integration on \\(a, b)\\ using a fixed number of points. Very efficient
for smooth "bell-like" functions and functions with rapidly convergent
power series. Does not provide an error estimate.

**Gauss-Kronrod Quadrature:** An adaptive extension of Gaussian
quadrature. Adds \\n+1\\ nodes (Kronrod points) to an \\n\\-point
Gaussian quadrature to provide an *a posteriori* error estimate
(\\O(h^{3n+1})\\ vs \\O(h^{2n-1})\\). Preserves exponential convergence
for smooth functions. Best suited for smooth functions with no end-point
singularities.

## Usage

``` r
trapezoidal(f, a, b, tol = sqrt(.Machine$double.eps), max_refinements = 12)

gauss_legendre(f, a, b, points = 7)

gauss_kronrod(
  f,
  a,
  b,
  points = 15,
  max_depth = 15,
  tol = sqrt(.Machine$double.eps)
)
```

## Arguments

- f:

  A function to integrate. It should accept a single numeric value and
  return a single numeric value.

- a:

  The lower limit of integration.

- b:

  The upper limit of integration.

- tol:

  The tolerance for the approximation. For trapezoidal, default is
  `sqrt(.Machine$double.eps)`. For Gauss-Kronrod, default is
  `sqrt(.Machine$double.eps)`.

- max_refinements:

  The maximum number of refinements to apply. Default is 12.

- points:

  The number of evaluation points to use in the Gauss-Legendre or
  Gauss-Kronrod quadrature.

- max_depth:

  Sets the maximum number of interval splittings for Gauss-Kronrod
  permitted before stopping. Set this to zero for non-adaptive
  quadrature.

## Value

A single numeric value with the computed integral.

## See also

[`numerical_differentiation`](https://andrjohns.github.io/boostmath/reference/numerical_differentiation.md),
[`double_exponential_quadrature`](https://andrjohns.github.io/boostmath/reference/double_exponential_quadrature.md)

## Examples

``` r
# Trapezoidal rule integration of sin(x) from 0 to pi (Periodic over 0 to 2*pi)
trapezoidal(sin, 0, pi)
#> [1] 2

# Gauss-Legendre integration of exp(x) from 0 to 1
gauss_legendre(exp, 0, 1, points = 7)
#> [1] 1.718282

# Adaptive Gauss-Kronrod integration of log(x) from 1 to 2
gauss_kronrod(log, 1, 2, points = 15, max_depth = 10)
#> [1] 0.3862944
```
