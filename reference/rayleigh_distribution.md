# Rayleigh Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Rayleigh
distribution.

## Usage

``` r
rayleigh_distribution(sigma = 1)

rayleigh_pdf(x, sigma = 1)

rayleigh_lpdf(x, sigma = 1)

rayleigh_cdf(x, sigma = 1)

rayleigh_lcdf(x, sigma = 1)

rayleigh_quantile(p, sigma = 1)
```

## Arguments

- sigma:

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/rayleigh.html)
for more details on the mathematical background.

## Examples

``` r
# Rayleigh distribution with sigma = 1
dist <- rayleigh_distribution(1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.1175031
logcdf(dist, 0.5)
#> [1] -2.141291
pdf(dist, 0.5)
#> [1] 0.4412485
logpdf(dist, 0.5)
#> [1] -0.8181472
hazard(dist, 0.5)
#> [1] 0.5
chf(dist, 0.5)
#> [1] 0.125
mean(dist)
#> [1] 1.253314
median(dist)
#> [1] 1.17741
mode(dist)
#> [1] 1
range(dist)
#> [1]   0 Inf
quantile(dist, 0.2)
#> [1] 0.6680472
standard_deviation(dist)
#> [1] 0.6551364
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 0.4292037
skewness(dist)
#> [1] 0.6311107
kurtosis(dist)
#> [1] 3.245089
kurtosis_excess(dist)
#> [1] 0.2450893

# Convenience functions
rayleigh_pdf(1)
#> [1] 0.6065307
rayleigh_lpdf(1)
#> [1] -0.5
rayleigh_cdf(1)
#> [1] 0.3934693
rayleigh_lcdf(1)
#> [1] -0.9327521
rayleigh_quantile(0.5)
#> [1] 1.17741
```
