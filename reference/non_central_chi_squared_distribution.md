# Noncentral Chi-Squared Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Noncentral
Chi-Squared distribution.

The noncentral chi-squared distribution is a generalization of the
Chi-Squared Distribution. If \\X_i\\ are \\\nu\\ independent, normally
distributed random variables with means \\\mu_i\\ and variances
\\\sigma_i^2\\, then the random variable \$\$\sum\_{i=1}^\nu
\frac{X_i^2}{\sigma_i^2}\$\$ is distributed according to the noncentral
chi-squared distribution.

The noncentral chi-squared distribution has two parameters: \\\nu\\
which specifies the number of degrees of freedom (i.e. the number of
\\X_i\\), and \\\lambda\\ which is related to the mean of the random
variables \\X_i\\ by: \$\$\lambda = \sum\_{i=1}^\nu
\frac{\mu_i^2}{\sigma_i^2}\$\$ (Note that some references define
\\\lambda\\ as one half of the above sum).

This leads to a PDF of: \$\$f(x;\nu,\lambda) = \sum\_{k=0}^\infty
\frac{e^{-\lambda/2}(\lambda/2)^k}{k!} f(x; \nu+2k)\$\$ where
\\f(x;\nu)\\ is the central chi-squared distribution PDF.

**Accuracy and Implementation Notes:** The CDF and its complement are
evaluated using Temme's relation to determine the crossover point
(approx when \\F(\nu,\lambda;\nu+\lambda) \approx 0.5\\). For small
\\\lambda\\, Ding's method (series representation) is used. For large
\\\lambda (\> 200)\\, Krishnamoorthy's method is used, starting the
summation at the \\\lambda\\-th term. Computed values are comparable to
the R Math library, with failures mostly in corner cases with very small
probabilities.

## Usage

``` r
non_central_chi_squared_distribution(df, lambda)

non_central_chi_squared_pdf(x, df, lambda)

non_central_chi_squared_lpdf(x, df, lambda)

non_central_chi_squared_cdf(x, df, lambda)

non_central_chi_squared_lcdf(x, df, lambda)

non_central_chi_squared_quantile(p, df, lambda)

non_central_chi_squared_find_degrees_of_freedom(lambda, x, alpha)

non_central_chi_squared_find_non_centrality(df, x, alpha)
```

## Arguments

- df:

  degrees of freedom (df \> 0)

- lambda:

  noncentrality parameter (lambda \>= 0)

- x:

  quantile

- p:

  probability (0 \<= p \<= 1)

- alpha:

  The acceptable probability of a Type I error (false positive).

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_chi_squared_dist.html)
for more details on the mathematical background.

## Examples

``` r
if (FALSE) { # \dontrun{
# Noncentral Chi-Squared distribution with 3 degrees of freedom and noncentrality
# parameter 1
dist <- non_central_chi_squared_distribution(3, 1)
# Apply generic functions
cdf(dist, 0.5)
logcdf(dist, 0.5)
pdf(dist, 0.5)
logpdf(dist, 0.5)
hazard(dist, 0.5)
chf(dist, 0.5)
mean(dist)
median(dist)
mode(dist)
range(dist)
quantile(dist, 0.2)
standard_deviation(dist)
support(dist)
variance(dist)
skewness(dist)
kurtosis(dist)
kurtosis_excess(dist)

# Convenience functions
non_central_chi_squared_pdf(2, 3, 1)
non_central_chi_squared_lpdf(2, 3, 1)
non_central_chi_squared_cdf(2, 3, 1)
non_central_chi_squared_lcdf(2, 3, 1)
non_central_chi_squared_quantile(0.5, 3, 1)

# Find degrees of freedom needed for CDF at 2.0 with noncentrality parameter 1.0 = 0.05
non_central_chi_squared_find_degrees_of_freedom(1.0, 2.0, 0.05)
# Find noncentrality parameter needed for CDF at 2.0 with 3 degrees of freedom = 0.05
non_central_chi_squared_find_non_centrality(3, 2.0, 0.05)
} # }
```
