# Polynomial Root-Finding

Functions for finding roots of polynomials of degree 2, 3, and 4
(quadratic, cubic, quartic).

**Quadratic Roots:** Solves \\ax^2 + bx + c = 0\\. Returns real roots.
If roots are complex, behavior depends on implementation (typically NaN
for this real-valued interface).

**Cubic Roots:** Solves \\ax^3 + bx^2 + cx + d = 0\\. Returns real
roots.

**Quartic Roots:** Solves \\ax^4 + bx^3 + cx^2 + dx + e = 0\\. Returns
real roots.

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

  Coefficient of the highest degree term.

- b:

  Coefficient of the second highest degree term.

- c:

  Coefficient of the third highest degree term (or constant for
  quadratic).

- d:

  Coefficient of the fourth highest degree term (or constant for cubic).

- root:

  The root to evaluate the residual or condition number at.

- e:

  Constant term for quartic.

## Value

A numeric vector containing the real roots of the polynomial.

## Details

These functions use analytic formulas where possible and numerically
stable implementations to avoid catastrophic cancellation.

## Examples

``` r
# Quadratic: x^2 - 3x + 2 = 0 -> Roots: 1, 2
quadratic_roots(1, -3, 2)
#> [1] 1 2

# Cubic: x^3 - 6x^2 + 11x - 6 = 0 -> Roots: 1, 2, 3
cubic_roots(1, -6, 11, -6)
#> [1] 1 2 3

# Quartic: x^4 - 10x^3 + 35x^2 - 50x + 24 = 0 -> Roots: 1, 2, 3, 4
quartic_roots(1, -10, 35, -50, 24)
#> [1] 1 2 3 4

# Residual and Condition Number
cubic_root_residual(1, -6, 11, -6, 1)
#> [1] 0.000000e+00 1.110223e-14
cubic_root_condition_number(1, -6, 11, -6, 1)
#> [1] 12
```
