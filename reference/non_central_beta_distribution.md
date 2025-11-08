# Noncentral Beta Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Noncentral Beta
distribution.

## Usage

``` r
non_central_beta_distribution(alpha, beta, lambda)

non_central_beta_pdf(x, alpha, beta, lambda)

non_central_beta_lpdf(x, alpha, beta, lambda)

non_central_beta_cdf(x, alpha, beta, lambda)

non_central_beta_lcdf(x, alpha, beta, lambda)

non_central_beta_quantile(p, alpha, beta, lambda)
```

## Arguments

- alpha:

  first shape parameter (alpha \> 0)

- beta:

  second shape parameter (beta \> 0)

- lambda:

  noncentrality parameter (lambda \>= 0)

- x:

  quantile (0 \<= x \<= 1)

- p:

  probability (0 \<= p \<= 1)

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_beta_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Noncentral Beta distribution with shape parameters alpha = 2, beta = 3
# and noncentrality parameter lambda = 1
dist <- non_central_beta_distribution(2, 3, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5977904
logcdf(dist, 0.5)
#> [1] -0.514515
pdf(dist, 0.5)
#> [1] 1.643543
logpdf(dist, 0.5)
#> [1] 0.4968546
hazard(dist, 0.5)
#> [1] 4.086286
chf(dist, 0.5)
#> [1] 0.910782
mean(dist)
#> [1] 0.44664
median(dist)
#> [1] 0.4416064
mode(dist)
#> [1] 0.4262677
range(dist)
#> [1] 0 1
quantile(dist, 0.2)
#> [1] 0.2549084
standard_deviation(dist)
#> [1] 0.2040433
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.04163366

# Convenience functions
non_central_beta_pdf(0.5, 2, 3, 1)
#> [1] 1.643543
non_central_beta_lpdf(0.5, 2, 3, 1)
#> [1] 0.4968546
non_central_beta_cdf(0.5, 2, 3, 1)
#> [1] 0.5977904
non_central_beta_lcdf(0.5, 2, 3, 1)
#> [1] -0.514515
non_central_beta_quantile(0.5, 2, 3, 1)
#> [1] 0.4416064
```
