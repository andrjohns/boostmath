# Basic Mathematical Functions

Functions to compute sine, cosine, logarithm, exponential, cube root,
square root, power, hypotenuse, and inverse square root.

## Usage

``` r
sin_pi(x)

cos_pi(x)

log1p_boost(x)

expm1_boost(x)

cbrt(x)

sqrt1pm1(x)

powm1(x, y)

hypot(x, y)

rsqrt(x)
```

## Arguments

- x:

  Input numeric value

- y:

  Second input numeric value (for power and hypotenuse functions)

## Value

A single numeric value with the computed result of the function.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/powers.html))
for more details on the mathematical background.

## Examples

``` r
# sin(pi * 0.5)
sin_pi(0.5)
#> [1] 1
# cos(pi * 0.5)
cos_pi(0.5)
#> [1] 0
# log(1 + 0.5)
log1p_boost(0.5)
#> [1] 0.4054651
# exp(0.5) - 1
expm1_boost(0.5)
#> [1] 0.6487213
cbrt(8)
#> [1] 2
# sqrt(1 + 0.5) - 1
sqrt1pm1(0.5)
#> [1] 0.2247449
# 2^3 - 1
powm1(2, 3)
#> [1] 7
hypot(3, 4)
#> [1] 5
rsqrt(4)
#> [1] 0.5
```
