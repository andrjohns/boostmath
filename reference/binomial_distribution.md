# Binomial Distribution Functions

Functions to compute the probability mass function (pmf), cumulative
distribution function, quantile function, and confidence bounds for the
Binomial distribution.

The Binomial distribution models the number of successes \$k\$ in \$n\$
independent trials with success probability \$p\$. The pmf is

\$\$P(X = k) = \binom{n}{k} p^k (1 - p)^{n-k}\$\$

for integers \$\$0 \le k \le n\$\$, and the CDF gives \$\$P(X \le
k)\$\$.

**Accuracy and Implementation Notes:** CDF and related functions are
implemented using incomplete beta functions (`ibeta`, `ibetac`). The pmf
is evaluated via `ibeta_derivative` for stability. Quantiles are
obtained numerically (TOMS 748), since no closed-form inverse exists for
discrete \$k\$. As a discrete distribution, quantiles are rounded
outward to ensure at least the requested coverage; use complements for
improved tail accuracy.

**Confidence Bounds:** `binomial_find_lower_bound_on_p` and
`binomial_find_upper_bound_on_p` implement Clopper-Pearson exact
intervals (default) or Jeffreys prior intervals, as described in the
Boost documentation.

## Usage

``` r
binomial_distribution(n, prob)

binomial_pdf(k, n, prob)

binomial_lpdf(k, n, prob)

binomial_cdf(k, n, prob)

binomial_lcdf(k, n, prob)

binomial_quantile(p, n, prob)

binomial_find_lower_bound_on_p(n, k, alpha, method = "clopper_pearson_exact")

binomial_find_upper_bound_on_p(n, k, alpha, method = "clopper_pearson_exact")

binomial_find_minimum_number_of_trials(k, prob, alpha)

binomial_find_maximum_number_of_trials(k, prob, alpha)
```

## Arguments

- n:

  Number of trials (n \>= 0).

- prob:

  Probability of success on each trial (0 \<= prob \<= 1).

- k:

  Number of successes (0 \<= k \<= n).

- p:

  Probability (0 \<= p \<= 1).

- alpha:

  Largest acceptable probability that the true value of the success
  fraction is less than the value returned (by
  `binomial_find_lower_bound_on_p`) or greater than the value returned
  (by `binomial_find_upper_bound_on_p`).

- method:

  Method to use for calculating the confidence bounds. Options are
  "clopper_pearson_exact" (default) and "jeffreys_prior".

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/binomial_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Binomial distribution with n = 10, prob = 0.5
dist <- binomial_distribution(10, 0.5)
# Apply generic functions
cdf(dist, 2)
#> [1] 0.0546875
logcdf(dist, 2)
#> [1] -2.90612
pdf(dist, 2)
#> [1] 0.04394531
logpdf(dist, 2)
#> [1] -3.124809
hazard(dist, 2)
#> [1] 0.0464876
chf(dist, 2)
#> [1] 0.05623972
mean(dist)
#> [1] 5
median(dist)
#> [1] 5
mode(dist)
#> [1] 5
range(dist)
#> [1]  0 10
quantile(dist, 0.2)
#> [1] 3
standard_deviation(dist)
#> [1] 1.581139
support(dist)
#> [1]  0 10
variance(dist)
#> [1] 2.5
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 2.8
kurtosis_excess(dist)
#> [1] -0.2

# Convenience functions
binomial_pdf(3, 10, 0.5)
#> [1] 0.1171875
binomial_lpdf(3, 10, 0.5)
#> [1] -2.14398
binomial_cdf(3, 10, 0.5)
#> [1] 0.171875
binomial_lcdf(3, 10, 0.5)
#> [1] -1.760988
binomial_quantile(0.5, 10, 0.5)
#> [1] 5

if (FALSE) { # \dontrun{
# Find lower bound on p given k = 3 successes in n = 10 trials with 95% confidence
binomial_find_lower_bound_on_p(10, 3, 0.05)
# Find upper bound on p given k = 3 successes in n = 10 trials with 95% confidence
binomial_find_upper_bound_on_p(10, 3, 0.05)
# Find minimum number of trials n to observe k = 3 successes with p = 0.5 at 95% confidence
binomial_find_minimum_number_of_trials(3, 0.5, 0.05)
# Find maximum number of trials n to observe k = 3 successes with p = 0.5 at 95% confidence
binomial_find_maximum_number_of_trials(3, 0.5, 0.05)
} # }
```
