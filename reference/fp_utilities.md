# Floating Point Utilities

Utilities for floating point number manipulation and analysis.

## Usage

``` r
float_next(x)

float_prior(x)

float_distance(x, y)

float_advance(x, distance)

ulp(x)

relative_difference(x, y)

epsilon_difference(x, y)
```

## Arguments

- x:

  A numeric value.

- y:

  A numeric value.

- distance:

  Integer number of ULPS to advance by.

## Value

A numeric value after performing the specified floating point operation.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/utils.html)
for more details on the mathematical background.

## Examples

``` r
print(float_next(1.0), digits = 20)
#> [1] 1.000000000000000222
print(float_distance(1.0, 2.0), digits = 20)
#> [1] 4503599627370496
print(float_prior(1.0), digits = 20)
#> [1] 0.99999999999999988898
print(float_advance(1.0, 10), digits = 20)
#> [1] 1.0000000000000022204
print(ulp(1.0), digits = 20)
#> [1] 2.2204460492503130808e-16
print(relative_difference(1.1, 1.1000009), digits = 20)
#> [1] 8.1818181805395140825e-07
print(epsilon_difference(1.1, 1.1000009), digits = 20)
#> [1] 3684763330.909090519
```
