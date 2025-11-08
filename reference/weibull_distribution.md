# Weibull Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Weibull
distribution.

## Usage

``` r
weibull_distribution(shape, scale = 1)

weibull_pdf(x, shape, scale = 1)

weibull_lpdf(x, shape, scale = 1)

weibull_cdf(x, shape, scale = 1)

weibull_lcdf(x, shape, scale = 1)

weibull_quantile(p, shape, scale = 1)
```

## Arguments

- shape:

  shape parameter

- scale:

  scale parameter (default is 1)

- x:

  quantile

- p:

  probability (0 \<= p \<= 1)

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/weibull_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Weibull distribution with shape = 1, scale = 1
dist <- weibull_distribution(1, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.3934693
logcdf(dist, 0.5)
#> [1] -0.9327521
pdf(dist, 0.5)
#> [1] 0.6065307
logpdf(dist, 0.5)
#> [1] -0.5
hazard(dist, 0.5)
#> [1] 1
chf(dist, 0.5)
#> [1] 0.5
mean(dist)
#> [1] 1
median(dist)
#> [1] 0.6931472
mode(dist)
#> [1] 0
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.2231436
standard_deviation(dist)
#> [1] 1
support(dist)
#> [1] 2.225074e-308 1.797693e+308
variance(dist)
#> [1] 1
skewness(dist)
#> [1] 2
kurtosis(dist)
#> [1] 9
kurtosis_excess(dist)
#> [1] 6

# Convenience functions
weibull_pdf(1, shape = 1, scale = 1)
#> [1] 0.3678794
weibull_lpdf(1, shape = 1, scale = 1)
#> [1] -1
weibull_cdf(1, shape = 1, scale = 1)
#> [1] 0.6321206
weibull_lcdf(1, shape = 1, scale = 1)
#> [1] -0.4586751
weibull_quantile(0.5, shape = 1, scale = 1)
#> [1] 0.6931472
```
