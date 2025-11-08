# Holtsmark Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Holtsmark
distribution.

## Usage

``` r
holtsmark_distribution(location = 0, scale = 1)

holtsmark_pdf(x, location = 0, scale = 1)

holtsmark_lpdf(x, location = 0, scale = 1)

holtsmark_cdf(x, location = 0, scale = 1)

holtsmark_lcdf(x, location = 0, scale = 1)

holtsmark_quantile(p, location = 0, scale = 1)
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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/holtsmark_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Holtsmark distribution with location 0 and scale 1
dist <- holtsmark_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6394042
logcdf(dist, 0.5)
#> [1] -0.4472184
pdf(dist, 0.5)
#> [1] 0.2622968
logpdf(dist, 0.5)
#> [1] -1.338278
hazard(dist, 0.5)
#> [1] 0.7273985
chf(dist, 0.5)
#> [1] 1.019998
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -1.234616
standard_deviation(dist)
#> [1] Inf
support(dist)
#> [1] -Inf  Inf
variance(dist)
#> [1] Inf

# Convenience functions
holtsmark_pdf(3)
#> [1] 0.03150942
holtsmark_lpdf(3)
#> [1] -3.457469
holtsmark_cdf(3)
#> [1] 0.9484022
holtsmark_lcdf(3)
#> [1] -0.05297661
holtsmark_quantile(0.5)
#> [1] 0
```
