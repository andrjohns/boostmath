# Geometric Distribution Functions

Functions to compute the probability mass function (pmf), cumulative
distribution function, quantile function, and confidence bounds for the
Geometric distribution.

The geometric distribution models the number of failures \$k\$ before
the first success in Bernoulli trials with success probability \$p\$.
The pmf is

\$\$P(X = k) = (1-p)^k p, \quad k \in \\0,1,2,\dots\\\$\$

**Accuracy and Implementation Notes:** Implemented using `pow`, `exp`,
and `log1p`. `logcdf` is specialised for numerical accuracy. This is a
discrete distribution; quantiles are rounded outward to ensure at least
the requested coverage. For extreme \$p\$ close to 1, accuracy can
degrade.

**Confidence Bounds:** The bound and trial-estimation functions are
implemented as in the negative binomial distribution (successes = 1),
using Clopper-Pearson style bounds and numeric inversion.

## Usage

``` r
geometric_distribution(prob)

geometric_pdf(x, prob)

geometric_lpdf(x, prob)

geometric_cdf(x, prob)

geometric_lcdf(x, prob)

geometric_quantile(p, prob)

geometric_find_lower_bound_on_p(trials, alpha)

geometric_find_upper_bound_on_p(trials, alpha)

geometric_find_minimum_number_of_trials(failures, prob, alpha)

geometric_find_maximum_number_of_trials(failures, prob, alpha)
```

## Arguments

- prob:

  Probability of success (0 \< prob \< 1).

- x:

  Quantile value (non-negative integer).

- p:

  Probability (0 \<= p \<= 1).

- trials:

  Number of trials.

- alpha:

  Largest acceptable probability that the true value of the success
  fraction is less than the value returned (by
  `geometric_find_lower_bound_on_p`) or greater than the value returned
  (by `geometric_find_upper_bound_on_p`).

- failures:

  Number of failures.

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/geometric_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Geometric distribution with probability of success prob = 0.5
dist <- geometric_distribution(0.5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6464466
logcdf(dist, 0.5)
#> [1] -0.4362647
pdf(dist, 0.5)
#> [1] 0.3535534
logpdf(dist, 0.5)
#> [1] -1.039721
hazard(dist, 0.5)
#> [1] 1
chf(dist, 0.5)
#> [1] 1.039721
mean(dist)
#> [1] 1
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0
standard_deviation(dist)
#> [1] 1.414214
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 2
skewness(dist)
#> [1] 2.12132
kurtosis(dist)
#> [1] 9.5
kurtosis_excess(dist)
#> [1] 6.5

# Convenience functions
geometric_pdf(3, 0.5)
#> [1] 0.0625
geometric_lpdf(3, 0.5)
#> [1] -2.772589
geometric_cdf(3, 0.5)
#> [1] 0.9375
geometric_lcdf(3, 0.5)
#> [1] -0.06453852
geometric_quantile(0.5, 0.5)
#> [1] 0
if (FALSE) { # \dontrun{
# Find lower bound on p given 5 trials with 95% confidence
geometric_find_lower_bound_on_p(5, 0.05)
# Find upper bound on p given 5 trials with 95% confidence
geometric_find_upper_bound_on_p(5, 0.05)
# Find minimum number of trials to observe 3 failures with p = 0.5 at 95% confidence
geometric_find_minimum_number_of_trials(3, 0.5, 0.05)
# Find maximum number of trials to observe 3 failures with p = 0.5 at 95% confidence
geometric_find_maximum_number_of_trials(3, 0.5, 0.05)
} # }
```
