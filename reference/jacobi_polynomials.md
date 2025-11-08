# Jacobi Polynomials and Related Functions

Functions to compute Jacobi polynomials, their derivatives, and related
functions.

## Usage

``` r
jacobi(n, alpha, beta, x)

jacobi_prime(n, alpha, beta, x)

jacobi_double_prime(n, alpha, beta, x)

jacobi_derivative(n, alpha, beta, x, k)
```

## Arguments

- n:

  Degree of the polynomial

- alpha:

  First parameter of the polynomial

- beta:

  Second parameter of the polynomial

- x:

  Argument of the polynomial

- k:

  Order of the derivative

## Value

A single numeric value with the computed Jacobi polynomial, its
derivative, or k-th derivative.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/jacobi.html)
for more details on the mathematical background.

## Examples

``` r
# Jacobi polynomial P_2^(1, 2)(0.5)
jacobi(2, 1, 2, 0.5)
#> [1] -0.1875
# Derivative of the Jacobi polynomial P_2^(1, 2)'(0.5)
jacobi_prime(2, 1, 2, 0.5)
#> [1] 3.75
# Second derivative of the Jacobi polynomial P_2^(1, 2)''(0.5)
jacobi_double_prime(2, 1, 2, 0.5)
#> [1] 10.5
# 3rd derivative of the Jacobi polynomial P_2^(1, 2)^(k)(0.5)
jacobi_derivative(2, 1, 2, 0.5, 3)
#> [1] 0
```
