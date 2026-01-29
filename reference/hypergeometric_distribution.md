# Hypergeometric Distribution Functions

Functions to compute the probability mass function (pmf), cumulative
distribution function, and quantile function for the Hypergeometric
distribution.

For a population of size \$N\$ with \$r\$ successes and \$N-r\$
failures, drawing \$n\$ items without replacement, the probability of
observing \$k\$ successes is

\$\$P(X = k) = \frac{\binom{r}{k}\binom{N-r}{n-k}}{\binom{N}{n}}\$\$

with support \\k \in \[\max(0, n + r - N), \min(n, r)\]\\.

**Accuracy and Implementation Notes:** For small \$N\$, factorial table
lookup provides high accuracy. For larger \$N\$ up to the largest stored
prime, a prime-factorization method is used. For very large \$N\$,
accuracy degrades roughly by \$\$\log\_{10}(N)\$\$ digits. The CDF is
computed by summing PDFs using recurrence relations, and quantiles are
obtained by summing from the tail. As a strictly discrete distribution,
quantiles are rounded outward to ensure coverage.

## Usage

``` r
hypergeometric_distribution(r, n, N)

hypergeometric_pdf(x, r, n, N)

hypergeometric_lpdf(x, r, n, N)

hypergeometric_cdf(x, r, n, N)

hypergeometric_lcdf(x, r, n, N)

hypergeometric_quantile(p, r, n, N)
```

## Arguments

- r:

  Number of successes in the population (r \>= 0).

- n:

  Number of draws (n \>= 0).

- N:

  Population size (N \>= r).

- x:

  Quantile value (non-negative integer).

- p:

  Probability (0 \<= p \<= 1).

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/hypergeometric_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Hypergeometric distribution with r = 5, n = 10, N = 20
dist <- hypergeometric_distribution(5, 10, 20)
# Apply generic functions
cdf(dist, 4)
#> [1] 0.9837461
logcdf(dist, 4)
#> [1] -0.01638741
pdf(dist, 4)
#> [1] 0.1354489
logpdf(dist, 4)
#> [1] -1.999161
hazard(dist, 4)
#> [1] 8.333333
chf(dist, 4)
#> [1] 4.119424
mean(dist)
#> [1] 2.5
median(dist)
#> [1] 3
mode(dist)
#> [1] 3
range(dist)
#> [1] 0 5
quantile(dist, 0.2)
#> [1] 1
standard_deviation(dist)
#> [1] 0.9933993
support(dist)
#> [1] 0 5
variance(dist)
#> [1] 0.9868421
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 5.756863
kurtosis_excess(dist)
#> [1] 2.756863

# Convenience functions
hypergeometric_pdf(3, 5, 10, 20)
#> [1] 0.3482972
hypergeometric_lpdf(3, 5, 10, 20)
#> [1] -1.054699
hypergeometric_cdf(3, 5, 10, 20)
#> [1] 0.8482972
hypergeometric_lcdf(3, 5, 10, 20)
#> [1] -0.1645242
hypergeometric_quantile(0.5, 5, 10, 20)
#> [1] 3
```
