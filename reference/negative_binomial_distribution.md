# Negative Binomial Distribution Functions

Functions to compute the probability mass function (pmf), cumulative
distribution function, and quantile function for the Negative Binomial
distribution.

For \$r\$ successes with success fraction \$p\$, the probability of
observing \$k\$ failures before the \$r\$-th success is

\$\$P(X = k) = \binom{k+r-1}{k} p^r (1-p)^k, \quad k \in
\\0,1,2,\dots\\\$\$

**Accuracy and Implementation Notes:** Implemented using incomplete beta
functions (`ibeta`, `ibetac`) and their derivatives for the PDF. As a
discrete distribution, quantiles are rounded outward to ensure coverage.
Confidence bounds use Clopper-Pearson style intervals.

## Usage

``` r
negative_binomial_distribution(successes, success_fraction)

negative_binomial_pdf(x, successes, success_fraction)

negative_binomial_lpdf(x, successes, success_fraction)

negative_binomial_cdf(x, successes, success_fraction)

negative_binomial_lcdf(x, successes, success_fraction)

negative_binomial_quantile(p, successes, success_fraction)

negative_binomial_find_lower_bound_on_p(trials, successes, alpha)

negative_binomial_find_upper_bound_on_p(trials, successes, alpha)

negative_binomial_find_minimum_number_of_trials(
  failures,
  success_fraction,
  alpha
)

negative_binomial_find_maximum_number_of_trials(
  failures,
  success_fraction,
  alpha
)
```

## Arguments

- successes:

  Number of successes (successes \> 0).

- success_fraction:

  Probability of success on each trial (0 \<= success_fraction \<= 1).

- x:

  Quantile value.

- p:

  Probability (0 \<= p \<= 1).

- trials:

  Number of trials.

- alpha:

  Significance level (0 \< alpha \< 1).

- failures:

  Number of failures (failures \>= 0).

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/negative_binomial_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Negative Binomial distribution with successes = 5, success_fraction = 0.5
dist <- negative_binomial_distribution(5, 0.5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.06449911
logcdf(dist, 0.5)
#> [1] -2.741104
pdf(dist, 0.5)
#> [1] 0.05437955
logpdf(dist, 0.5)
#> [1] -2.911767
hazard(dist, 0.5)
#> [1] 0.05812881
chf(dist, 0.5)
#> [1] 0.06667318
mean(dist)
#> [1] 5
median(dist)
#> [1] 4
mode(dist)
#> [1] 4
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 1
standard_deviation(dist)
#> [1] 3.162278
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 10
skewness(dist)
#> [1] 0.9486833
kurtosis(dist)
#> [1] 4.3
kurtosis_excess(dist)
#> [1] 1.3

# Convenience functions
negative_binomial_pdf(3, 5, 0.5)
#> [1] 0.1367188
negative_binomial_lpdf(3, 5, 0.5)
#> [1] -1.989829
negative_binomial_cdf(3, 5, 0.5)
#> [1] 0.3632812
negative_binomial_lcdf(3, 5, 0.5)
#> [1] -1.012578
negative_binomial_quantile(0.5, 5, 0.5)
#> [1] 4

if (FALSE) { # \dontrun{
# Find lower bound on p given 10 trials and 5 successes with 95% confidence
negative_binomial_find_lower_bound_on_p(10, 5, 0.05)
# Find upper bound on p given 10 trials and 5 successes with 95% confidence
negative_binomial_find_upper_bound_on_p(10, 5, 0.05)
# Find minimum number of trials to observe 3 failures with success fraction 0.5 at 95% confidence
negative_binomial_find_minimum_number_of_trials(3, 0.5, 0.05)
# Find maximum number of trials to observe 3 failures with success fraction 0.5 at 95% confidence
negative_binomial_find_maximum_number_of_trials(3, 0.5, 0.05)
} # }
```
