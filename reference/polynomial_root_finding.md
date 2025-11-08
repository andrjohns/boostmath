# Polynomial Root-Finding

Functions for finding roots of polynomials of various degrees.

## Usage

``` r
quadratic_roots(a, b, c)

cubic_roots(a, b, c, d)

cubic_root_residual(a, b, c, d, root)

cubic_root_condition_number(a, b, c, d, root)

quartic_roots(a, b, c, d, e)
```

## Arguments

- a:

  Coefficient of the polynomial term (e.g., for quadratic ax^2 + bx + c,
  a is the coefficient of x^2).

- b:

  Coefficient of the linear term (e.g., for quadratic ax^2 + bx + c, b
  is the coefficient of x).

- c:

  Constant term (e.g., for quadratic ax^2 + bx + c, c is the constant).

- d:

  Coefficient of the cubic term (for cubic ax^3 + bx^2 + cx + d, d is
  the constant).

- root:

  The root to evaluate the residual or condition number at.

- e:

  Coefficient of the quartic term (for quartic ax^4 + bx^3 + cx^2 + dx +
  e, e is the constant).

## Value

A numeric vector of the polynomial roots, residual, or condition number.

## Details

This package provides functions to find roots of quadratic, cubic, and
quartic polynomials. The functions return the roots as numeric vectors.

## Examples

``` r
# Example of finding quadratic roots
quadratic_roots(1, -3, 2)
#> [1] 1 2
# Example of finding cubic roots
cubic_roots(1, -6, 11, -6)
#> [1] 1 2 3
# Example of finding quartic roots
quartic_roots(1, -10, 35, -50, 24)
#> [1] 1 2 3 4
# Example of finding cubic root residual
cubic_root_residual(1, -6, 11, -6, 1)
#> [1] 0.000000e+00 1.110223e-14
# Example of finding cubic root condition number
cubic_root_condition_number(1, -6, 11, -6, 1)
#> [1] 12
```
