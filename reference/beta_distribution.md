# Beta Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, quantile function, and parameter estimators for
the Beta distribution.

The Beta distribution is defined on \\x \in \[0, 1\]\\ with shape
parameters \\\alpha \> 0\\ and \\\beta \> 0\\.

The PDF is:

\$\$f(x;\alpha, \beta) = \frac{x^{\alpha - 1}(1-x)^{\beta -
1}}{B(\alpha, \beta)}\$\$

Where \\B(\alpha, \beta)\\ is the beta function.

The CDF is:

\$\$F(x; \alpha, \beta) = I_x(\alpha, \beta)\$\$

Where \\I_x\\ is the regularized incomplete beta function.

The quantile is:

\$\$F^{-1}(p; \alpha, \beta) = I\_{p}^{-1}(\alpha, \beta)\$\$

Where \\I\_{p}^{-1}\\ is the inverse of the regularized incomplete beta
function.

## Usage

``` r
beta_distribution(alpha, beta)

beta_pdf(x, alpha, beta)

beta_lpdf(x, alpha, beta)

beta_cdf(x, alpha, beta)

beta_lcdf(x, alpha, beta)

beta_quantile(p, alpha, beta)

beta_find_alpha(mean = NULL, variance = NULL, beta = NULL, x = NULL, p = NULL)

beta_find_beta(mean = NULL, variance = NULL, alpha = NULL, x = NULL, p = NULL)
```

## Arguments

- alpha:

  Shape parameter (alpha \> 0).

- beta:

  Shape parameter (beta \> 0).

- x:

  Quantile value (0 ≤ x ≤ 1).

- p:

  Probability (0 ≤ p ≤ 1).

- mean:

  Mean of the Beta distribution.

- variance:

  Variance of the Beta distribution.

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/beta_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Beta distribution with shape parameters alpha = 2, beta = 5
dist <- beta_distribution(2, 5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.890625
logcdf(dist, 0.5)
#> [1] -0.1158318
pdf(dist, 0.5)
#> [1] 0.9375
logpdf(dist, 0.5)
#> [1] -0.06453852
hazard(dist, 0.5)
#> [1] 8.571429
chf(dist, 0.5)
#> [1] 2.212973
mean(dist)
#> [1] 0.2857143
median(dist)
#> [1] 0.26445
mode(dist)
#> [1] 0.2
range(dist)
#> [1] 0 1
quantile(dist, 0.2)
#> [1] 0.1398807
standard_deviation(dist)
#> [1] 0.1597191
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.0255102
skewness(dist)
#> [1] 0.5962848
kurtosis(dist)
#> [1] 2.88
kurtosis_excess(dist)
#> [1] -0.12

# Convenience functions
beta_pdf(0.5, 2, 5)
#> [1] 0.9375
beta_lpdf(0.5, 2, 5)
#> [1] -0.06453852
beta_cdf(0.5, 2, 5)
#> [1] 0.890625
beta_lcdf(0.5, 2, 5)
#> [1] -0.1158318
beta_quantile(0.5, 2, 5)
#> [1] 0.26445

if (FALSE) { # \dontrun{
# Find alpha given mean and variance
beta_find_alpha(mean = 0.3, variance = 0.02)
# Find alpha given beta, x, and probability
beta_find_alpha(beta = 5, x = 0.4, p = 0.6)
# Find beta given mean and variance
beta_find_beta(mean = 0.3, variance = 0.02)
# Find beta given alpha, x, and probability
beta_find_beta(alpha = 2, x = 0.4, p = 0.6)
} # }
```
