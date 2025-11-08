# Arcsine Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the arcsine
distribution.

## Usage

``` r
arcsine_distribution(x_min = 0, x_max = 1)

arcsine_pdf(x, x_min = 0, x_max = 1)

arcsine_lpdf(x, x_min = 0, x_max = 1)

arcsine_cdf(x, x_min = 0, x_max = 1)

arcsine_lcdf(x, x_min = 0, x_max = 1)

arcsine_quantile(p, x_min = 0, x_max = 1)
```

## Arguments

- x_min:

  minimum value of the distribution (default is 0)

- x_max:

  maximum value of the distribution (default is 1)

- x:

  quantile

- p:

  probability

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/arcine_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Arcsine distribution with default parameters
dist <- arcsine_distribution()
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5
logcdf(dist, 0.5)
#> [1] -0.6931472
pdf(dist, 0.5)
#> [1] 0.6366198
logpdf(dist, 0.5)
#> [1] -0.4515827
hazard(dist, 0.5)
#> [1] 1.27324
chf(dist, 0.5)
#> [1] 0.6931472
mean(dist)
#> [1] 0.5
median(dist)
#> [1] 0.5
range(dist)
#> [1] 0 1
quantile(dist, 0.2)
#> [1] 0.0954915
standard_deviation(dist)
#> [1] 0.3535534
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.125
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 1.5
kurtosis_excess(dist)
#> [1] -1.5

# Convenience functions
arcsine_pdf(0.5)
#> [1] 0.6366198
arcsine_lpdf(0.5)
#> [1] -0.4515827
arcsine_cdf(0.5)
#> [1] 0.5
arcsine_lcdf(0.5)
#> [1] -0.6931472
arcsine_quantile(0.5)
#> [1] 0.5
```
