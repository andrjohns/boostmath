# Landau Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Landau
distribution.

The Landau distribution is a stable distribution with \$\$\alpha=1\$\$
and \$\$\beta=1\$\$. A standard integral representation of its PDF is

\$\$f(x) = \frac{1}{\pi}\int_0^\infty \exp\left(-t\log t - x
t\right)\sin(\pi t)\\dt.\$\$

The location parameter \$\$\mu\$\$ and scale parameter \$c\$ shift and
scale the distribution, with a bias term \$\$b = -\frac{2}{\pi}\log
c\$\$ applied in the Boost parameterization.

**Accuracy and Implementation Notes:** Boost reports errors within about
4 epsilon except for the rapidly decaying left tail. Some moments (mean,
variance, skewness, kurtosis) are undefined and will raise errors.

## Usage

``` r
landau_distribution(location = 0, scale = 1)

landau_pdf(x, location = 0, scale = 1)

landau_lpdf(x, location = 0, scale = 1)

landau_cdf(x, location = 0, scale = 1)

landau_lcdf(x, location = 0, scale = 1)

landau_quantile(p, location = 0, scale = 1)
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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/landau_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Landau distribution with location 0 and scale 1
dist <- landau_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.4842393
logcdf(dist, 0.5)
#> [1] -0.7251762
pdf(dist, 0.5)
#> [1] 0.2123185
logpdf(dist, 0.5)
#> [1] -1.549668
hazard(dist, 0.5)
#> [1] 0.4116608
chf(dist, 0.5)
#> [1] 0.6621123
median(dist)
#> [1] 0.5756301
mode(dist)
#> [1] -0.4293145
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.5948319
support(dist)
#> [1] -Inf  Inf

# Convenience functions
landau_pdf(3)
#> [1] 0.05863949
landau_lpdf(3)
#> [1] -2.836347
landau_cdf(3)
#> [1] 0.7792967
landau_lcdf(3)
#> [1] -0.2493635
landau_quantile(0.5)
#> [1] 0.5756301
```
