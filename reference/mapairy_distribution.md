# Map-Airy Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Map-Airy
distribution.

The Map-Airy distribution is a stable distribution with
\$\$\alpha=3/2\$\$ and \$\$\beta=1\$\$, used to model the area under a
Brownian excursion. It is parameterised by location \$\$\mu\$\$ and
scale \$c\$.

**Accuracy and Implementation Notes:** Boost reports errors within about
4 epsilon except in the rapidly decaying left tail. Some moments
(skewness, kurtosis) are undefined and will raise errors if requested.

## Usage

``` r
mapairy_distribution(location = 0, scale = 1)

mapairy_pdf(x, location = 0, scale = 1)

mapairy_lpdf(x, location = 0, scale = 1)

mapairy_cdf(x, location = 0, scale = 1)

mapairy_lcdf(x, location = 0, scale = 1)

mapairy_quantile(p, location = 0, scale = 1)
```

## Arguments

- location:

  Location parameter (default is 0).

- scale:

  Scale parameter (default is 1).

- x:

  Quantile value.

- p:

  Probability (0 \<= p \<= 1).

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/mapairy_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Map-Airy distribution with location 0 and scale 1
dist <- mapairy_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.7527466
logcdf(dist, 0.5)
#> [1] -0.2840266
pdf(dist, 0.5)
#> [1] 0.1477024
logpdf(dist, 0.5)
#> [1] -1.912556
hazard(dist, 0.5)
#> [1] 0.5973726
chf(dist, 0.5)
#> [1] 1.397342
mean(dist)
#> [1] 0
median(dist)
#> [1] -0.7167107
mode(dist)
#> [1] -1.161587
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -1.834427
standard_deviation(dist)
#> [1] Inf
support(dist)
#> [1] -Inf  Inf
variance(dist)
#> [1] Inf

# Convenience functions
mapairy_pdf(3)
#> [1] 0.02799732
mapairy_lpdf(3)
#> [1] -3.575647
mapairy_cdf(3)
#> [1] 0.9316961
mapairy_lcdf(3)
#> [1] -0.07074859
mapairy_quantile(0.5)
#> [1] -0.7167107
```
