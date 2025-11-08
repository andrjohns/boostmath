# Exponential Integrals

Functions to compute various exponential integrals, including En and Ei.

## Usage

``` r
expint_en(n, z)

expint_ei(z)
```

## Arguments

- n:

  Order of the integral (for En)

- z:

  Argument of the integral (for En and Ei)

## Value

A single numeric value with the computed exponential integral.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/expint.html)
for

## Examples

``` r
# Exponential integral En with n = 1 and z = 2
expint_en(1, 2)
#> [1] 0.04890051
# Exponential integral Ei with z = 2
expint_ei(2)
#> [1] 4.954234
```
