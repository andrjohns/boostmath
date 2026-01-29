# Holtsmark Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Holtsmark
distribution.

The Holtsmark distribution is a stable distribution with stability
parameter \$\$\alpha = 3/2\$\$ and symmetry parameter \$\$\beta = 0\$\$,
commonly used in astrophysics. It is parameterised by location
\$\$\mu\$\$ and scale \$c\$.

A common integral representation of the PDF is

\$\$f(x) = \frac{1}{\pi}\int_0^\infty
\cos\left(t(x-\mu)\right)\\\exp\left(-(c t)^{3/2}\right)\\dt.\$\$

**Accuracy and Implementation Notes:** Boost reports errors within about
4 epsilon for PDF/CDF-complement in double precision. Some moments
(e.g., skewness and kurtosis) are mathematically undefined and will
raise errors if requested.

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
