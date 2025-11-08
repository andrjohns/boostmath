# Error Functions and Inverses

Functions to compute the error function, complementary error function,
and their inverses.

## Usage

``` r
erf(x)

erfc(x)

erf_inv(p)

erfc_inv(p)
```

## Arguments

- x:

  Input numeric value

- p:

  Probability value (0 \<= p \<= 1)

## Value

A single numeric value with the computed error function, complementary
error function, or their inverses.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_erf.html)
for more details

## Examples

``` r
# Error function
erf(0.5)
#> [1] 0.5204999
# Complementary error function
erfc(0.5)
#> [1] 0.4795001
# Inverse error function
erf_inv(0.5)
#> [1] 0.4769363
# Inverse complementary error function
erfc_inv(0.5)
#> [1] 0.4769363
```
