# Lambert W Function and Its Derivatives

Functions to compute the Lambert W function and its derivatives for the
principal branch (\\W_0\\) and the branch -1 (\\W\_{-1}\\).

## Usage

``` r
lambert_w0(z)

lambert_wm1(z)

lambert_w0_prime(z)

lambert_wm1_prime(z)
```

## Arguments

- z:

  Argument of the Lambert W function

## Value

A single numeric value with the computed Lambert W function or its
derivative.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/lambert_w.html)
for more details on the mathematical background.

## Examples

``` r
# Lambert W Function (Principal Branch)
lambert_w0(0.3)
#> [1] 0.2367553
# Lambert W Function (Branch -1)
lambert_wm1(-0.3)
#> [1] -1.781337
# Derivative of the Lambert W Function (Principal Branch)
lambert_w0_prime(0.3)
#> [1] 0.6381087
# Derivative of the Lambert W Function (Branch -1)
lambert_wm1_prime(-0.3)
#> [1] -7.599525
```
