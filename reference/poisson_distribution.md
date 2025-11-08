# Poisson Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Poisson
distribution.

## Usage

``` r
poisson_distribution(lambda = 1)

poisson_pdf(x, lambda = 1)

poisson_lpdf(x, lambda = 1)

poisson_cdf(x, lambda = 1)

poisson_lcdf(x, lambda = 1)

poisson_quantile(p, lambda = 1)
```

## Arguments

- lambda:

  rate parameter (default is 1)

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/poisson_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Poisson distribution with lambda = 1
dist <- poisson_distribution(1)
# Apply generic functions
cdf(dist, 5)
#> [1] 0.9994058
logcdf(dist, 5)
#> [1] -0.0005943614
pdf(dist, 5)
#> [1] 0.003065662
logpdf(dist, 5)
#> [1] -5.787492
hazard(dist, 5)
#> [1] 5.159442
chf(dist, 5)
#> [1] 7.42832
mean(dist)
#> [1] 1
median(dist)
#> [1] 1
mode(dist)
#> [1] 1
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0
standard_deviation(dist)
#> [1] 1
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 1
skewness(dist)
#> [1] 1
kurtosis(dist)
#> [1] 4
kurtosis_excess(dist)
#> [1] 1

# Convenience functions
poisson_pdf(0, 1)
#> [1] 0.3678794
poisson_lpdf(0, 1)
#> [1] -1
poisson_cdf(0, 1)
#> [1] 0.3678794
poisson_lcdf(0, 1)
#> [1] -1
poisson_quantile(0.5, 1)
#> [1] 1
```
