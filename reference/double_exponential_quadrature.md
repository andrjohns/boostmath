# Double Exponential Quadrature

Numerical integration using double exponential quadrature methods
(Tanh-Sinh, Sinh-Sinh, Exp-Sinh). These methods use variable
transformations to achieve high-order convergence, often optimal for
functions in the Hardy space (holomorphic in the unit disk).

**Tanh-Sinh Quadrature:** Best for integration over a finite interval
\\(a, b)\\. Can handle singularities at the endpoints of the integration
domain. Converges rapidly for holomorphic integrands.

**Sinh-Sinh Quadrature:** Designed for integration over the entire real
line \\(-\infty, \infty)\\. Handles integrands with large features or
decay properties.

**Exp-Sinh Quadrature:** Designed for integration over a semi-infinite
interval, typically \\(0, \infty)\\, or ranges like \\(a, \infty)\\ or
\\(-\infty, b)\\. Supports endpoint singularities.

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

## See also

[`numerical_integration`](https://andrjohns.github.io/boostmath/reference/numerical_integration.md)

## Examples

``` r
# Tanh-sinh quadrature of log(x) from 0 to 1 (Endpoint singularity)
tanh_sinh(function(x) { log(x) * log1p(-x) }, a = 0, b = 1)
#> [1] 0.3550659

# Sinh-sinh quadrature of exp(-x^2) over (-Inf, Inf)
sinh_sinh(function(x) { exp(-x * x) })
#> [1] 1.772454

# Exp-sinh quadrature of exp(-3*x) from 0 to Inf
exp_sinh(function(x) { exp(-3 * x) }, a = 0, b = Inf)
#> [1] 0.3333333
```
