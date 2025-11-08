# Ooura Fourier Integrals

Computing Fourier sine and cosine integrals using Ooura's method.

## Usage

``` r
ooura_fourier_sin(
  f,
  omega = 1,
  relative_error_tolerance = sqrt(.Machine$double.eps),
  levels = 8
)

ooura_fourier_cos(
  f,
  omega = 1,
  relative_error_tolerance = sqrt(.Machine$double.eps),
  levels = 8
)
```

## Arguments

- f:

  A function to integrate. It should accept a single numeric value and
  return a single numeric value.

- omega:

  The frequency parameter for the sine integral.

- relative_error_tolerance:

  The relative error tolerance for the approximation.

- levels:

  The number of levels of refinement to apply. Default is 8.

## Value

A single numeric value with the computed Fourier sine or cosine
integral, with attribute 'relative_error' indicating the relative error
of the approximation.

## Examples

``` r
if (FALSE) { # \dontrun{
# Fourier sine integral of sin(x) with omega = 1
ooura_fourier_sin(function(x) { 1 / x }, omega = 1)
# Fourier cosine integral of cos(x) with omega = 1
ooura_fourier_cos(function(x) { 1/ (x * x + 1) }, omega = 1)
} # }
```
