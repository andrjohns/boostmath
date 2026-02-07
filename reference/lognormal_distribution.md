# Log Normal Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Log Normal
distribution.

The PDF is:

\$\$f(x; \mu, \sigma^2) = \frac{1}{x \sigma
\sqrt{2\pi}}\exp\left(-\frac{(\ln x - \mu)^2}{2 \sigma^2}\right), \quad
x\>0\$\$

The CDF is:

\$\$F(x; \mu, \sigma^2) = \Phi \left( \frac{\ln x - \mu}{\sigma}
\right)\$\$

The Quantile is:

\$\$F^{-1}(p; \mu, \sigma^2) = \exp(\mu + \sigma \Phi^{-1}(p))\$\$

## Usage

``` r
lognormal_distribution(location = 0, scale = 1)

lognormal_pdf(x, location = 0, scale = 1)

lognormal_lpdf(x, location = 0, scale = 1)

lognormal_cdf(x, location = 0, scale = 1)

lognormal_lcdf(x, location = 0, scale = 1)

lognormal_quantile(p, location = 0, scale = 1)
```

## Arguments

- location:

  Location parameter (default is 0).

- scale:

  Scale parameter (default is 1).

- x:

  Quantile value (x \> 0).

- p:

  Probability (0 \<= p \<= 1).

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/lognormal_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Log Normal distribution with location = 0, scale = 1
dist <- lognormal_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.2441086
logcdf(dist, 0.5)
#> [1] -1.410142
pdf(dist, 0.5)
#> [1] 0.6274961
logpdf(dist, 0.5)
#> [1] -0.4660179
hazard(dist, 0.5)
#> [1] 0.8301405
chf(dist, 0.5)
#> [1] 0.2798576
mean(dist)
#> [1] 1.648721
median(dist)
#> [1] 1
mode(dist)
#> [1] 0.3678794
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.4310112
standard_deviation(dist)
#> [1] 2.161197
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 4.670774
skewness(dist)
#> [1] 6.184877
kurtosis(dist)
#> [1] 113.9364
kurtosis_excess(dist)
#> [1] 110.9364

# Convenience functions
lognormal_pdf(0)
#> [1] 0
lognormal_lpdf(0)
#> [1] -Inf
lognormal_cdf(0)
#> [1] 0
lognormal_lcdf(0)
#> [1] -Inf
lognormal_quantile(0.5)
#> [1] 1
```
