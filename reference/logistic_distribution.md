# Logistic Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Logistic
distribution.

## Usage

``` r
logistic_distribution(location = 0, scale = 1)

logistic_pdf(x, location = 0, scale = 1)

logistic_lpdf(x, location = 0, scale = 1)

logistic_cdf(x, location = 0, scale = 1)

logistic_lcdf(x, location = 0, scale = 1)

logistic_quantile(p, location = 0, scale = 1)
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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/logistic_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Logistic distribution with location = 0, scale = 1
dist <- logistic_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6224593
logcdf(dist, 0.5)
#> [1] -0.474077
pdf(dist, 0.5)
#> [1] 0.2350037
logpdf(dist, 0.5)
#> [1] -1.448154
hazard(dist, 0.5)
#> [1] 0.6224593
chf(dist, 0.5)
#> [1] 0.974077
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -1.386294
standard_deviation(dist)
#> [1] 1.813799
support(dist)
#> [1] -1.797693e+308  1.797693e+308
variance(dist)
#> [1] 3.289868
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 4.2
kurtosis_excess(dist)
#> [1] 1.2

# Convenience functions
logistic_pdf(0)
#> [1] 0.25
logistic_lpdf(0)
#> [1] -1.386294
logistic_cdf(0)
#> [1] 0.5
logistic_lcdf(0)
#> [1] -0.6931472
logistic_quantile(0.5)
#> [1] 0
```
