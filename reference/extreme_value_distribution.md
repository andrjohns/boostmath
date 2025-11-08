# Extreme Value Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Extreme Value
distribution.

## Usage

``` r
extreme_value_distribution(location = 0, scale = 1)

extreme_value_pdf(x, location = 0, scale = 1)

extreme_value_lpdf(x, location = 0, scale = 1)

extreme_value_cdf(x, location = 0, scale = 1)

extreme_value_lcdf(x, location = 0, scale = 1)

extreme_value_quantile(p, location = 0, scale = 1)
```

## Arguments

- location:

  location parameter (default is 0)

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/extreme_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Extreme Value distribution with location = 0, scale = 1
dist <- extreme_value_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5452392
logcdf(dist, 0.5)
#> [1] -0.6065307
pdf(dist, 0.5)
#> [1] 0.3307043
logpdf(dist, 0.5)
#> [1] -1.106531
hazard(dist, 0.5)
#> [1] 0.727205
chf(dist, 0.5)
#> [1] 0.7879837
mean(dist)
#> [1] 0.5772157
median(dist)
#> [1] 0.3665129
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.475885
standard_deviation(dist)
#> [1] 1.28255
support(dist)
#> [1] -1.797693e+308  1.797693e+308
variance(dist)
#> [1] 1.644934
skewness(dist)
#> [1] 1.139547
kurtosis(dist)
#> [1] 5.4
kurtosis_excess(dist)
#> [1] 2.4

# Convenience functions
extreme_value_pdf(0)
#> [1] 0.3678794
extreme_value_lpdf(0)
#> [1] -1
extreme_value_cdf(0)
#> [1] 0.3678794
extreme_value_lcdf(0)
#> [1] -1
extreme_value_quantile(0.5)
#> [1] 0.3665129
```
