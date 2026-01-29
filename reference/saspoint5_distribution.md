# S\\\alpha\\S Point5 Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the S\\\alpha\\S Point5
distribution.

The S\\\alpha\\S Point5 distribution is a special case of a stable
distribution with shape parameter \\\alpha=1/2\\, \\\beta=0\\.

It has the probability density function (PDF): \$\$f(x; \mu, \gamma) =
\frac{1}{\sqrt{2\pi}} x^{-3/2} e^{-\frac{1}{2x}}\$\$ (Note: The boost
documentation reference shows a standard form, generalised by location
\\\mu\\ and scale \\\gamma\\).

This distribution has heavier tails than the Cauchy distribution. Note
that the S\\\alpha\\S Point5 distribution does not have a defined mean
or standard deviation.

**Accuracy and Implementation Notes:** The error is within 4 epsilon.

## Usage

``` r
saspoint5_distribution(location = 0, scale = 1)

saspoint5_pdf(x, location = 0, scale = 1)

saspoint5_lpdf(x, location = 0, scale = 1)

saspoint5_cdf(x, location = 0, scale = 1)

saspoint5_lcdf(x, location = 0, scale = 1)

saspoint5_quantile(p, location = 0, scale = 1)
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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/saspoint5_dist.html)
for more details on the mathematical background.

## Examples

``` r
# SaS Point5 distribution with location 0 and scale 1
dist <- saspoint5_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6686904
logcdf(dist, 0.5)
#> [1] -0.402434
pdf(dist, 0.5)
#> [1] 0.1707624
logpdf(dist, 0.5)
#> [1] -1.767482
hazard(dist, 0.5)
#> [1] 0.5154165
chf(dist, 0.5)
#> [1] 1.104702
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -2.397479
support(dist)
#> [1] -Inf  Inf

# Convenience functions
saspoint5_pdf(3)
#> [1] 0.02379919
saspoint5_lpdf(3)
#> [1] -3.738104
saspoint5_cdf(3)
#> [1] 0.8164545
saspoint5_lcdf(3)
#> [1] -0.2027841
saspoint5_quantile(0.5)
#> [1] 0
```
