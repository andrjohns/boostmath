# Chatterjee Correlation Function

Functions to compute the Chatterjee correlation.

## Usage

``` r
chatterjee_correlation(x, y)
```

## Arguments

- x:

  A numeric vector.

- y:

  A numeric vector.

## Value

A two-element numeric vector containing the test statistic and the
p-value.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/chatterjee_correlation.html)
for more details on the mathematical background.

## Examples

``` r
x <- c(1, 2, 3, 4, 5)
y <- c(2, 3, 5, 7, 11)
# Chatterjee correlation
chatterjee_correlation(x, y)
#> [1] 0.5
```
