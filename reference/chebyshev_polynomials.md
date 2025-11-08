# Chebyshev Polynomials and Related Functions

Functions to compute Chebyshev polynomials of the first and second kind.

## Usage

``` r
chebyshev_next(x, Tn, Tn_1)

chebyshev_t(n, x)

chebyshev_u(n, x)

chebyshev_t_prime(n, x)

chebyshev_clenshaw_recurrence(c, x)

chebyshev_clenshaw_recurrence_ab(c, a, b, x)
```

## Arguments

- x:

  Argument of the polynomial

- Tn:

  Value of the Chebyshev polynomial \\(T_n(x))\\

- Tn_1:

  Value of the Chebyshev polynomial \\(T\_{n-1}(x))\\

- n:

  Degree of the polynomial

- c:

  Coefficients of the Chebyshev polynomial

- a:

  Lower bound of the interval

- b:

  Upper bound of the interval

## Value

A single numeric value with the computed Chebyshev polynomial, its
derivative, or related functions.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/chebyshev.html)
for more details on the mathematical background.

## Examples

``` r
# Chebyshev polynomial of the first kind T_2(0.5)
chebyshev_t(2, 0.5)
#> [1] -0.5
# Chebyshev polynomial of the second kind U_2(0.5)
chebyshev_u(2, 0.5)
#> [1] 0
# Derivative of the Chebyshev polynomial of the first kind T_2'(0.5)
chebyshev_t_prime(2, 0.5)
#> [1] 2
# Next Chebyshev polynomial of the first kind T_3(0.5) using T_2(0.5) and T_1(0.5)
chebyshev_next(0.5, chebyshev_t(2, 0.5), chebyshev_t(1, 0.5))
#> [1] -1
# Chebyshev polynomial of the first kind using Clenshaw's recurrence with coefficients
# c = c(1, 0, -1) at x = 0.5
chebyshev_clenshaw_recurrence(c(1, 0, -1), 0.5)
#> [1] 1
# Chebyshev polynomial of the first kind using Clenshaw's recurrence with interval [0, 1]
chebyshev_clenshaw_recurrence_ab(c(1, 0, -1), 0, 1, 0.5)
#> [1] 1.5
```
