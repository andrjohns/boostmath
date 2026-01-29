# Exponential Integrals

Functions to compute various exponential integrals, including En and Ei.

Exponential integrals are fundamental special functions in mathematical
analysis appearing in many applications including radiative transfer,
antenna theory, and solutions to differential equations.

**Exponential Integral En:**

Defined by the integral: \$\$E_n(z) = \int_1^\infty \frac{e^{-zt}}{t^n}
dt\$\$

The function uses different computational strategies: continued fraction
expansion for large z, and infinite series for small z. Special case E1
(when n=1) employs rational approximations for enhanced accuracy.

**Exponential Integral Ei:**

Defined by the integral: \$\$Ei(z) = -\int\_{-z}^\infty \frac{e^{-t}}{t}
dt\$\$

For z \< 0, the function uses rational approximations via the zeta
function. For z \> 0, it employs infinite series for arbitrary precision
or optimised rational approximations for standard precision types.

Both functions are implemented using high-accuracy algorithms with
sub-epsilon precision over most of their range.

## Usage

``` r
expint_en(n, z)

expint_ei(z)
```

## Arguments

- n:

  Order of the integral (for En), must be a non-negative integer

- z:

  Argument of the integral (for En and Ei)

## Value

A single numeric value with the computed exponential integral.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/expint.html)
for more details on the mathematical background.

## Examples

``` r
# Exponential integral En with n = 1 and z = 2
expint_en(1, 2)
#> [1] 0.04890051
# Exponential integral Ei with z = 2
expint_ei(2)
#> [1] 4.954234
```
