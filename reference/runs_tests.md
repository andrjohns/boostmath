# Runs Tests

Functions for Runs Tests.

## Usage

``` r
runs_above_and_below_threshold(v, threshold)

runs_above_and_below_median(v)
```

## Arguments

- v:

  A numeric vector.

- threshold:

  A single numeric value.

## Value

A two-element numeric vector containing the t-statistic and the p-value.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/runs_test.html)
for more details on the mathematical background.

## Examples

``` r
# Runs Above and Below Threshold
runs_above_and_below_threshold(c(1, 2, 3, 4, 5), threshold = 3)
#> [1] -1.2247449  0.2206714
# Runs Above and Below Median
runs_above_and_below_median(c(1, 2, 3, 4, 5))
#> [1] -1.2247449  0.2206714
```
