# Legendre Polynomials and Related Functions

Functions to compute Legendre polynomials of the first and second kind,
their derivatives, zeros, and related functions.

## Usage

``` r
legendre_p(n, x)

legendre_p_prime(n, x)

legendre_p_zeros(n)

legendre_p_m(n, m, x)

legendre_q(n, x)

legendre_next(n, x, Pl, Plm1)

legendre_next_m(n, m, x, Pl, Plm1)
```

## Arguments

- n:

  Degree of the polynomial

- x:

  Argument of the polynomial

- m:

  Order of the polynomial (for Legendre polynomials of the first kind)

- Pl:

  Value of the Legendre polynomial \\(P_l(x))\\

- Plm1:

  Value of the Legendre polynomial \\(P\_{l-1}(x))\\

## Value

A single numeric value with the computed Legendre polynomial, its
derivative, zeros, or related functions.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/legendre.html)
for more details on the mathematical background.

## Examples

``` r
# Legendre polynomial of the first kind P_2(0.5)
legendre_p(2, 0.5)
#> [1] -0.125
# Derivative of the Legendre polynomial of the first kind P_2'(0.5)
legendre_p_prime(2, 0.5)
#> [1] 1.5
# Zeros of the Legendre polynomial of the first kind P_2
legendre_p_zeros(2)
#> [1] 0.5773503
# Legendre polynomial of the first kind with order 1 P_2^1(0.5)
legendre_p_m(2, 1, 0.5)
#> [1] -1.299038
# Legendre polynomial of the second kind Q_2(0.5)
legendre_q(2, 0.5)
#> [1] -0.8186633
# Next Legendre polynomial of the first kind P_3(0.5) using P_2(0.5) and P_1(0.5)
legendre_next(2, 0.5, legendre_p(2, 0.5), legendre_p(1, 0.5))
#> [1] -0.4375
# Next Legendre polynomial of the first kind with order 1 P_3^1(0.5) using P_2^1(0.5) and P_1^1(0.5)
legendre_next_m(2, 1, 0.5, legendre_p_m(2, 1, 0.5), legendre_p_m(1, 1, 0.5))
#> [1] -0.3247595
```
