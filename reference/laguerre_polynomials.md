# Laguerre Polynomials and Related Functions

Functions to compute Laguerre polynomials of the first kind.

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

  Order of the polynomial (for Laguerre polynomials of the first kind)

- Ln:

  Value of the Laguerre polynomial \\(L_n(x))\\

- Lnm1:

  Value of the Laguerre polynomial \\(L\_{n-1}(x))\\

## Value

A single numeric value with the computed Laguerre polynomial, its
derivative, or related functions.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/laguerre.html)
for more details on the mathematical background.

## Examples

``` r
# Laguerre polynomial of the first kind L_2(0.5)
laguerre(2, 0.5)
#> [1] 0.125
# Laguerre polynomial of the first kind with order 1 L_2^1(0.5)
laguerre_m(2, 1, 0.5)
#> [1] 1.625
# Next Laguerre polynomial of the first kind L_3(0.5) using L_2(0.5) and L_1(0.5)
laguerre_next(2, 0.5, laguerre(2, 0.5), laguerre(1, 0.5))
#> [1] -0.1458333
# Next Laguerre polynomial of the first kind with order 1 L_3^1(0.5) using L_2^1(0.5) and L_1^1(0.5)
laguerre_next_m(2, 1, 0.5, laguerre_m(2, 1, 0.5), laguerre_m(1, 1, 0.5))
#> [1] 1.479167
```
