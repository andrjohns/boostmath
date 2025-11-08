# Gegenbauer Polynomials and Related Functions

Functions to compute Gegenbauer polynomials, their derivatives, and
related functions.

## Usage

``` r
gegenbauer(n, lambda, x)

gegenbauer_prime(n, lambda, x)

gegenbauer_derivative(n, lambda, x, k)
```

## Arguments

- n:

  Degree of the polynomial

- lambda:

  Parameter of the polynomial

- x:

  Argument of the polynomial

- k:

  Order of the derivative

## Value

A single numeric value with the computed Gegenbauer polynomial, its
derivative, or k-th derivative.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/gegenbauer.html)
for more details on the mathematical background.

## Examples

``` r
# Gegenbauer polynomial C_2^(1)(0.5)
gegenbauer(2, 1, 0.5)
#> [1] 0
# Derivative of the Gegenbauer polynomial C_2^(1)'(0.5)
gegenbauer_prime(2, 1, 0.5)
#> [1] 4
# k-th derivative of the Gegenbauer polynomial C_2^(1)''(0.5)
gegenbauer_derivative(2, 1, 0.5, 2)
#> [1] 8
```
