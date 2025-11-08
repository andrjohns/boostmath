# Inverse Gamma Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Inverse Gamma
distribution.

## Usage

``` r
inverse_gamma_distribution(shape, scale = 1)

inverse_gamma_pdf(x, shape, scale = 1)

inverse_gamma_lpdf(x, shape, scale = 1)

inverse_gamma_cdf(x, shape, scale = 1)

inverse_gamma_lcdf(x, shape, scale = 1)

inverse_gamma_quantile(p, shape, scale = 1)
```

## Arguments

- shape:

  shape parameter (shape \> 0)

- scale:

  scale parameter (scale \> 0; default is 1)

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_gamma_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Inverse Gamma distribution with shape = 5, scale = 4
dist <- inverse_gamma_distribution(5, 4)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.0996324
logcdf(dist, 0.5)
#> [1] -2.306268
pdf(dist, 0.5)
#> [1] 0.9160366
logpdf(dist, 0.5)
#> [1] -0.08769894
hazard(dist, 0.5)
#> [1] 1.017403
chf(dist, 0.5)
#> [1] 0.1049522
mean(dist)
#> [1] 1
median(dist)
#> [1] 0.8563644
mode(dist)
#> [1] 0.6666667
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.5951514
standard_deviation(dist)
#> [1] 0.5773503
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 0.3333333
skewness(dist)
#> [1] 3.464102
kurtosis(dist)
#> [1] 45
kurtosis_excess(dist)
#> [1] 42

# Convenience functions
inverse_gamma_pdf(2, 5, 4)
#> [1] 0.09022352
inverse_gamma_lpdf(2, 5, 4)
#> [1] -2.405465
inverse_gamma_cdf(2, 5, 4)
#> [1] 0.947347
inverse_gamma_lcdf(2, 5, 4)
#> [1] -0.05408985
inverse_gamma_quantile(0.5, 5, 4)
#> [1] 0.8563644
```
