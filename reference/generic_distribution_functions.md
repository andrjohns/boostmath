# Generic Distribution Functions

Generic functions for computing various properties of statistical
distributions.

## Usage

``` r
cdf(x, ...)

logcdf(x, ...)

pdf(x, ...)

logpdf(x, ...)

hazard(x, ...)

chf(x, ...)

mode(x, ...)

standard_deviation(x, ...)

support(x, ...)

variance(x, ...)

skewness(x, ...)

kurtosis(x, ...)

kurtosis_excess(x, ...)
```

## Arguments

- x:

  A distribution object created by a distribution constructor function.

- ...:

  Additional arguments passed to specific methods.

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, quantile, mean, median, mode, range, standard deviation,
support, variance, skewness, kurtosis, or excess kurtosis depending on
the function called.

## Examples

``` r
# Create a Weibull distribution
weibull_dist <- weibull_distribution(shape = 2, scale = 1)
# Compute the CDF at a specific point
cdf(weibull_dist, 1)
#> [1] 0.6321206
# Check support
support(weibull_dist)
#> [1] 2.225074e-308 1.797693e+308
```
