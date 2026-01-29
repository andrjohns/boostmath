# Laguerre Polynomials and Related Functions

Functions to compute Laguerre polynomials and associated Laguerre
polynomials.

Laguerre polynomials are orthogonal polynomials that appear in the
solution of the quantum harmonic oscillator, hydrogen atom
wavefunctions, and various problems in mathematical physics and
probability theory.

**Standard Laguerre Polynomials L_n(x):**

- `laguerre(n, x)`: Evaluates the Laguerre polynomial of degree n at
  point x

- Solutions to Laguerre's differential equation

- Orthogonal with respect to the weight function \\e^{-x}\\ on \[0, Inf)

**Associated Laguerre Polynomials L_n^m(x):**

- `laguerre_m(n, m, x)`: Evaluates the associated Laguerre polynomial of
  degree n and order m at point x

- Generalizations of the standard Laguerre polynomials

**Recurrence Relations:**

Three-term recurrence relations enable efficient sequential computation:

- `laguerre_next(n, x, Ln, Lnm1)`: Computes \\L\_{n+1}(x)\\ from \\L_n\\
  and \\L\_{n-1}\\

- `laguerre_next_m(n, m, x, Ln, Lnm1)`: Computes \\L\_{n+1}^m(x)\\ from
  previous values

**Implementation Notes:**

Functions use stable three-term recurrence relations that guarantee low
absolute error but cannot guarantee low relative error near polynomial
roots.

## Usage

``` r
laguerre(n, x)

laguerre_m(n, m, x)

laguerre_next(n, x, Ln, Lnm1)

laguerre_next_m(n, m, x, Ln, Lnm1)
```

## Arguments

- n:

  Degree of the polynomial

- x:

  Argument of the polynomial

- m:

  Order of the polynomial (for associated Laguerre polynomials)

- Ln:

  Value of the Laguerre polynomial \\L_n(x)\\

- Lnm1:

  Value of the Laguerre polynomial \\L\_{n-1}(x)\\

## Value

A single numeric value with the computed Laguerre polynomial.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/laguerre.html)
for more details on the mathematical background.

## Examples

``` r
# Laguerre polynomial L_2(0.5)
laguerre(2, 0.5)
#> [1] 0.125
# Associated Laguerre polynomial L_2^1(0.5)
laguerre_m(2, 1, 0.5)
#> [1] 1.625
# Next Laguerre polynomial L_3(0.5) using L_2(0.5) and L_1(0.5)
laguerre_next(2, 0.5, laguerre(2, 0.5), laguerre(1, 0.5))
#> [1] -0.1458333
# Next associated Laguerre polynomial L_3^1(0.5) using L_2^1(0.5) and L_1^1(0.5)
laguerre_next_m(2, 1, 0.5, laguerre_m(2, 1, 0.5), laguerre_m(1, 1, 0.5))
#> [1] 1.479167
```
