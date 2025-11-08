# Double Exponential Quadrature

Functions for numerical integration using double exponential quadrature
methods such as tanh-sinh, sinh-sinh, and exp-sinh quadrature.

## Usage

``` r
tanh_sinh(f, a, b, tol = sqrt(.Machine$double.eps), max_refinements = 15)

sinh_sinh(f, tol = sqrt(.Machine$double.eps), max_refinements = 9)

exp_sinh(f, a, b, tol = sqrt(.Machine$double.eps), max_refinements = 9)
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

  The maximum number of refinements to apply. Default is 15 for
  tanh-sinh and 9 for sinh-sinh and exp-sinh.

## Value

A single numeric value with the computed integral.

## Examples

``` r
# Tanh-sinh quadrature of log(x) from 0 to 1
tanh_sinh(function(x) { log(x) * log1p(-x) }, a = 0, b = 1)
#> [1] 0.3550659
# Sinh-sinh quadrature of exp(-x^2)
sinh_sinh(function(x) { exp(-x * x) })
#> [1] 1.772454
# Exp-sinh quadrature of exp(-3*x) from 0 to Inf
exp_sinh(function(x) { exp(-3 * x) }, a = 0, b = Inf)
#> [1] 0.3333333
```
