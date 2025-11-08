# Uniform Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Uniform
distribution.

## Usage

``` r
uniform_distribution(lower = 0, upper = 1)

uniform_pdf(x, lower = 0, upper = 1)

uniform_lpdf(x, lower = 0, upper = 1)

uniform_cdf(x, lower = 0, upper = 1)

uniform_lcdf(x, lower = 0, upper = 1)

uniform_quantile(p, lower = 0, upper = 1)
```

## Arguments

- lower:

  lower bound of the distribution (default is 0)

- upper:

  upper bound of the distribution (default is 1)

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/uniform_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Uniform distribution with lower = 0, upper = 1
dist <- uniform_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5
logcdf(dist, 0.5)
#> [1] -0.6931472
pdf(dist, 0.5)
#> [1] 1
logpdf(dist, 0.5)
#> [1] 0
hazard(dist, 0.5)
#> [1] 2
chf(dist, 0.5)
#> [1] 0.6931472
mean(dist)
#> [1] 0.5
median(dist)
#> [1] 0.5
mode(dist)
#> [1] 0
range(dist)
#> [1] -1.797693e+308  1.797693e+308
quantile(dist, 0.2)
#> [1] 0.2
standard_deviation(dist)
#> [1] 0.2886751
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.08333333
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 1.8
kurtosis_excess(dist)
#> [1] -1.2

# Convenience functions
uniform_pdf(0.5)
#> [1] 1
uniform_lpdf(0.5)
#> [1] 0
uniform_cdf(0.5)
#> [1] 0.5
uniform_lcdf(0.5)
#> [1] -0.6931472
uniform_quantile(0.5)
#> [1] 0.5
```
