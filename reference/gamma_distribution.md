# Gamma Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Gamma distribution.

## Usage

``` r
gamma_distribution(shape, scale = 1)

gamma_pdf(x, shape, scale = 1)

gamma_lpdf(x, shape, scale = 1)

gamma_cdf(x, shape, scale = 1)

gamma_lcdf(x, shape, scale = 1)

gamma_quantile(p, shape, scale = 1)
```

## Arguments

- shape:

  shape parameter (shape \> 0)

- scale:

  scale parameter (scale \> 0)

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/gamma_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Gamma distribution with shape = 3, scale = 4
dist <- gamma_distribution(3, 4)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.0002964775
logcdf(dist, 0.5)
#> [1] -8.123539
pdf(dist, 0.5)
#> [1] 0.001723627
logpdf(dist, 0.5)
#> [1] -6.363325
hazard(dist, 0.5)
#> [1] 0.001724138
chf(dist, 0.5)
#> [1] 0.0002965215
mean(dist)
#> [1] 12
median(dist)
#> [1] 10.69624
mode(dist)
#> [1] 8
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 6.140177
standard_deviation(dist)
#> [1] 6.928203
support(dist)
#> [1] 2.225074e-308 1.797693e+308
variance(dist)
#> [1] 48
skewness(dist)
#> [1] 1.154701
kurtosis(dist)
#> [1] 5
kurtosis_excess(dist)
#> [1] 2

# Convenience functions
gamma_pdf(2, 3, 4)
#> [1] 0.01895408
gamma_lpdf(2, 3, 4)
#> [1] -3.965736
gamma_cdf(2, 3, 4)
#> [1] 0.01438768
gamma_lcdf(2, 3, 4)
#> [1] -4.241383
gamma_quantile(0.5, 3, 4)
#> [1] 10.69624
```
