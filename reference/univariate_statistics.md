# Univariate Statistics Functions

Functions to compute various univariate statistics.

## Usage

``` r
mean_boost(x)

# Default S3 method
variance(x, ...)

sample_variance(x)

mean_and_sample_variance(x)

# Default S3 method
skewness(x, ...)

# Default S3 method
kurtosis(x, ...)

excess_kurtosis(x)

first_four_moments(x)

median_boost(x)

median_absolute_deviation(x)

interquartile_range(x)

gini_coefficient(x)

sample_gini_coefficient(x)

# Default S3 method
mode(x, ...)
```

## Arguments

- x:

  A numeric vector.

- ...:

  Additional arguments (not used).

## Value

A numeric value or vector with the computed statistic.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/univariate_statistics.html)
for more details on the mathematical background.

## Examples

``` r
# Mean
mean_boost(c(1, 2, 3, 4, 5))
#> [1] 3
# Variance
variance(c(1, 2, 3, 4, 5))
#> [1] 2
# Sample Variance
sample_variance(c(1, 2, 3, 4, 5))
#> [1] 2.5
# Mean and Sample Variance
mean_and_sample_variance(c(1, 2, 3, 4, 5))
#> [1] 3.0 2.5
# Skewness
skewness(c(1, 2, 3, 4, 5))
#> [1] 0
# Kurtosis
kurtosis(c(1, 2, 3, 4, 5))
#> [1] 1.7
# Excess Kurtosis
excess_kurtosis(c(1, 2, 3, 4, 5))
#> [1] -1.3
# First Four Moments
first_four_moments(c(1, 2, 3, 4, 5))
#> [1] 3.0 2.0 0.0 6.8
# Median
median_boost(c(1, 2, 3, 4, 5))
#> [1] 3
# Median Absolute Deviation
median_absolute_deviation(c(1, 2, 3, 4, 5))
#> [1] 1
# Interquartile Range
interquartile_range(c(1, 2, 3, 4, 5))
#> [1] 3
# Gini Coefficient
gini_coefficient(c(1, 2, 3, 4, 5))
#> [1] 0.2666667
# Sample Gini Coefficient
sample_gini_coefficient(c(1, 2, 3, 4, 5))
#> [1] 0.3333333
# Mode
mode(c(1, 2, 2, 3, 4))
#> [1] 2
```
