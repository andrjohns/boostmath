# Ooura Fourier Integrals

Computes Fourier sine and cosine integrals using Ooura's robust double
exponential method (1999). These methods are designed to handle
oscillatory integrals that are problematic for standard quadrature.

**Ooura Fourier Sine:** Computes the integral: \$\$\int_0^\infty f(t)
\sin(\omega t) dt\$\$

**Ooura Fourier Cosine:** Computes the integral: \$\$\int_0^\infty f(t)
\cos(\omega t) dt\$\$

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

  The frequency parameter \\\omega\\ for the sine or cosine term.

- relative_error_tolerance:

  The relative error tolerance for the approximation. Default is
  `sqrt(.Machine$double.eps)`.

- levels:

  The number of levels of refinement to apply. Default is 8.

## Value

A single numeric value with the computed Fourier sine or cosine
integral.

## Details

The method precomputes nodes and weights for efficiency. Convergence
depends on the position of the poles of the integrand in the complex
plane. If poles are too close to the real axis, convergence may be slow.

## References

Ooura, Takuya, and Masatake Mori. "A robust double exponential formula
for Fourier-type integrals." Journal of computational and applied
mathematics 112.1-2 (1999): 229-241.

## See also

[`double_exponential_quadrature`](https://andrjohns.github.io/boostmath/reference/double_exponential_quadrature.md)

## Examples

``` r
# Fourier sine integral of 1/x -> integral convergent to pi/2 approx
# sin(x)/x from 0 to Inf is pi/2. Here we integrate 1/x * sin(1*x).
ooura_fourier_sin(function(x) { 1 / x }, omega = 1)
#> [1] 1.570796
#> attr(,"relative_error")
#> [1] 1.265522e-11

# Fourier cosine integral of 1/(x^2 + 1) * cos(x)
# Expected value is pi/(2*e) approx 0.57786
ooura_fourier_cos(function(x) { 1/ (x * x + 1) }, omega = 1)
#> [1] 0.5778637
#> attr(,"relative_error")
#> [1] 6.417739e-09
```
