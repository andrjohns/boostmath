# Triangular Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Triangular
distribution.

## Usage

``` r
triangular_distribution(lower = -1, mode = 0, upper = 1)

triangular_pdf(x, lower = -1, mode = 0, upper = 1)

triangular_lpdf(x, lower = -1, mode = 0, upper = 1)

triangular_cdf(x, lower = -1, mode = 0, upper = 1)

triangular_lcdf(x, lower = -1, mode = 0, upper = 1)

triangular_quantile(p, lower = -1, mode = 0, upper = 1)
```

## Arguments

- lower:

  lower limit of the distribution (default is -1)

- mode:

  mode of the distribution (default is 0)

- upper:

  upper limit of the distribution (default is 1)

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/triangular_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Triangular distribution with lower = -1, mode = 0, upper = 1
dist <- triangular_distribution(-1, 0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.875
logcdf(dist, 0.5)
#> [1] -0.1335314
pdf(dist, 0.5)
#> [1] 0.5
logpdf(dist, 0.5)
#> [1] -0.6931472
hazard(dist, 0.5)
#> [1] 4
chf(dist, 0.5)
#> [1] 2.079442
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -1.797693e+308  1.797693e+308
quantile(dist, 0.2)
#> [1] -0.3675445
standard_deviation(dist)
#> [1] 0.4082483
support(dist)
#> [1] -1  1
variance(dist)
#> [1] 0.1666667
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 2.4
kurtosis_excess(dist)
#> [1] -0.6

# Convenience functions
triangular_pdf(1)
#> [1] 0
triangular_lpdf(1)
#> [1] -Inf
triangular_cdf(1)
#> [1] 1
triangular_lcdf(1)
#> [1] 0
triangular_quantile(0.5)
#> [1] 0
```
