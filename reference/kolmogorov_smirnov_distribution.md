# Kolmogorov-Smirnov Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Kolmogorov-Smirnov
distribution.

Boost implements the limiting (first-order) Kolmogorov distribution. The
CDF is expressed in terms of the Jacobi theta function:

\$\$F(x) = \vartheta_4\\\left(0, \frac{2x^2}{\pi}\right)\$\$

for \$\$x \ge 0\$\$. The PDF is obtained by differentiating the CDF, and
quantiles are computed via Newton-Raphson iteration.

**Accuracy and Implementation Notes:** The CDF uses the Jacobi theta
function and inherits its accuracy. The PDF is implemented separately.
The limiting distribution has nonzero mass above 1 for finite \$n\$
(unlike the exact KS distribution), especially when \$n\$ is small.

## Usage

``` r
kolmogorov_smirnov_distribution(n)

kolmogorov_smirnov_pdf(x, n)

kolmogorov_smirnov_lpdf(x, n)

kolmogorov_smirnov_cdf(x, n)

kolmogorov_smirnov_lcdf(x, n)

kolmogorov_smirnov_quantile(p, n)
```

## Arguments

- n:

  Sample size (n \> 0).

- x:

  Quantile value (x \>= 0).

- p:

  Probability (0 \<= p \<= 1).

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/kolmogorov_smirnov_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Kolmogorov-Smirnov distribution with sample size n = 10
dist <- kolmogorov_smirnov_distribution(10)
# Apply generic functions
cdf(dist, 2)
#> [1] 1
logcdf(dist, 2)
#> [1] 0
pdf(dist, 2)
#> [1] 2.887762e-33
logpdf(dist, 2)
#> [1] -74.92483
hazard(dist, 2)
#> [1] 80
chf(dist, 2)
#> [1] 79.30685
mean(dist)
#> [1] 0.2747169
median(dist)
#> [1] 0.2617017
mode(dist)
#> [1] 0.2325754
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.2039076
standard_deviation(dist)
#> [1] 0.08232448
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 0.00677732
skewness(dist)
#> [1] 0.8604261
kurtosis(dist)
#> [1] 3.881619
kurtosis_excess(dist)
#> [1] 0.881619

# Convenience functions
kolmogorov_smirnov_pdf(0.5, 10)
#> [1] 0.2695176
kolmogorov_smirnov_lpdf(0.5, 10)
#> [1] -1.311122
kolmogorov_smirnov_cdf(0.5, 10)
#> [1] 0.9865241
kolmogorov_smirnov_lcdf(0.5, 10)
#> [1] -0.01356751
kolmogorov_smirnov_quantile(0.5, 10)
#> [1] 0.2617017
```
