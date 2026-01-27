# Cauchy Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Cauchy
distribution.

The PDF is:

\$\$f(x; x_0, \gamma) = \frac{1}{\pi}\left(\frac{\gamma}{(x-x_0)^2 +
\gamma^2}\right)\$\$

The CDF:

\$\$F(x; x_0, \gamma) =
\frac{1}{\pi}\text{arctan}\left(\frac{x-x_0}{\gamma}\right)+\frac{1}{2}\$\$

## Usage

``` r
cauchy_distribution(location = 0, scale = 1)

cauchy_pdf(x, location = 0, scale = 1)

cauchy_lpdf(x, location = 0, scale = 1)

cauchy_cdf(x, location = 0, scale = 1)

cauchy_lcdf(x, location = 0, scale = 1)

cauchy_quantile(p, location = 0, scale = 1)
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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/cauchy_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Cauchy distribution with location = 0, scale = 1
dist <- cauchy_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6475836
logcdf(dist, 0.5)
#> [1] -0.4345074
pdf(dist, 0.5)
#> [1] 0.2546479
logpdf(dist, 0.5)
#> [1] -1.367873
hazard(dist, 0.5)
#> [1] 0.7225768
chf(dist, 0.5)
#> [1] 1.042942
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -1.376382
support(dist)
#> [1] -Inf  Inf

# Convenience functions
cauchy_pdf(0)
#> [1] 0.3183099
cauchy_lpdf(0)
#> [1] -1.14473
cauchy_cdf(0)
#> [1] 0.5
cauchy_lcdf(0)
#> [1] -0.6931472
cauchy_quantile(0.5)
#> [1] 0
```
