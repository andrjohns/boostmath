# Normal Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Normal
distribution.

## Usage

``` r
normal_distribution(mean = 0, sd = 1)

normal_pdf(x, mean = 0, sd = 1)

normal_lpdf(x, mean = 0, sd = 1)

normal_cdf(x, mean = 0, sd = 1)

normal_lcdf(x, mean = 0, sd = 1)

normal_quantile(p, mean = 0, sd = 1)
```

## Arguments

- mean:

  mean parameter (default is 0)

- sd:

  standard deviation parameter (default is 1)

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/normal_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Normal distribution with mean = 0, sd = 1
dist <- normal_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6914625
logcdf(dist, 0.5)
#> [1] -0.3689464
pdf(dist, 0.5)
#> [1] 0.3520653
logpdf(dist, 0.5)
#> [1] -1.043939
hazard(dist, 0.5)
#> [1] 1.141078
chf(dist, 0.5)
#> [1] 1.175912
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.8416212
standard_deviation(dist)
#> [1] 1
support(dist)
#> [1] -Inf  Inf
variance(dist)
#> [1] 1
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 3
kurtosis_excess(dist)
#> [1] 0

# Convenience functions
normal_pdf(0)
#> [1] 0.3989423
normal_lpdf(0)
#> [1] -0.9189385
normal_cdf(0)
#> [1] 0.5
normal_lcdf(0)
#> [1] -0.6931472
normal_quantile(0.5)
#> [1] 0
```
