# Inverse Hyperbolic Functions

Functions to compute the inverse hyperbolic functions: acosh, asinh, and
atanh.

## Usage

``` r
acosh_boost(x)

asinh_boost(x)

atanh_boost(x)
```

## Arguments

- x:

  Input numeric value

## Value

A single numeric value with the computed inverse hyperbolic function.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/inv_hyper.html)
for more details on the mathematical background.

## Examples

``` r
# Inverse Hyperbolic Cosine
acosh_boost(2)
#> [1] 1.316958
# Inverse Hyperbolic Sine
asinh_boost(1)
#> [1] 0.8813736
# Inverse Hyperbolic Tangent
atanh_boost(0.5)
#> [1] 0.5493061
```
