# Arcsine Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the arcsine
distribution on the interval \\\[x\_{min}, x\_{max}\]\\.

The arcsine distribution is a U-shaped distribution with infinite
density at the endpoints.

For \\x\_{min} \< x \< x\_{max}\\:

The PDF is:

\$\$f(x; x\_{min}, x\_{max}) = \frac{1}{\pi\sqrt{(x -
x\_{min})(x\_{max} - x)}}\$\$

The CDF is:

\$\$F(x; x\_{min}, x\_{max}) = \frac{2}{\pi}\arcsin\left(\sqrt{\frac{x -
x\_{min}}{x\_{max} - x\_{min}}}\right)\$\$

The quantile for \\0 \< p \< 1\\ is

\$\$F^{-1}(p; x\_{min}, x\_{max}) = x\_{min} + (x\_{max} -
x\_{min})\sin^2\left(\frac{\pi p}{2}\right)\$\$

For the standard distribution on \\\[0, 1\]\\, these reduce to \$\$f(x)
= 1/(\pi\sqrt{x(1-x)})\$\$ \$\$F(x) = \frac{2}{\pi}\arcsin(\sqrt{x})\$\$

## Usage

``` r
arcsine_distribution(x_min = 0, x_max = 1)

arcsine_pdf(x, x_min = 0, x_max = 1)

arcsine_lpdf(x, x_min = 0, x_max = 1)

arcsine_cdf(x, x_min = 0, x_max = 1)

arcsine_lcdf(x, x_min = 0, x_max = 1)

arcsine_quantile(p, x_min = 0, x_max = 1)
```

## Arguments

- x_min:

  Minimum value of the distribution (default is 0).

- x_max:

  Maximum value of the distribution (default is 1).

- x:

  Quantile value in \\\[x\_{min}, x\_{max}\]\\.

- p:

  Probability in \\\[0, 1\]\\.

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/arcine_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Arcsine distribution with default parameters
dist <- arcsine_distribution()
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5
logcdf(dist, 0.5)
#> [1] -0.6931472
pdf(dist, 0.5)
#> [1] 0.6366198
logpdf(dist, 0.5)
#> [1] -0.4515827
hazard(dist, 0.5)
#> [1] 1.27324
chf(dist, 0.5)
#> [1] 0.6931472
mean(dist)
#> [1] 0.5
median(dist)
#> [1] 0.5
range(dist)
#> [1] 0 1
quantile(dist, 0.2)
#> [1] 0.0954915
standard_deviation(dist)
#> [1] 0.3535534
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.125
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 1.5
kurtosis_excess(dist)
#> [1] -1.5

# Convenience functions
arcsine_pdf(0.5)
#> [1] 0.6366198
arcsine_lpdf(0.5)
#> [1] -0.4515827
arcsine_cdf(0.5)
#> [1] 0.5
arcsine_lcdf(0.5)
#> [1] -0.6931472
arcsine_quantile(0.5)
#> [1] 0.5
```
