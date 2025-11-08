# Numerical Integration

Functions for numerical integration using various methods such as
trapezoidal rule, Gauss-Legendre quadrature, and Gauss-Kronrod
quadrature.

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

  The tolerance for the approximation. Default is
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

## Examples

``` r
# Trapezoidal rule integration of sin(x) from 0 to pi
trapezoidal(sin, 0, pi)
#> [1] 2
# Gauss-Legendre integration of exp(x) from 0 to 1
gauss_legendre(exp, 0, 1, points = 7)
#> [1] 1.718282
# Adaptive Gauss-Kronrod integration of log(x) from 1 to 2
gauss_kronrod(log, 1, 2, points = 15, max_depth = 10)
#> [1] 0.3862944
```
