# Bernoulli Distribution Functions

Functions to compute the probability mass function (pmf), cumulative
distribution function, and quantile function for the Bernoulli
distribution.

The Bernoulli distribution models a single trial with outcomes \\k \in
\\0, 1\\\\ and success probability \\p\\:

\$\$P(X = 0) = 1 - p, \quad P(X = 1) = p\$\$ \$\$F(0)=1-p, \quad
F(1)=1\$\$

## Usage

``` r
bernoulli_distribution(p_success)

bernoulli_pdf(x, p_success)

bernoulli_lpdf(x, p_success)

bernoulli_cdf(x, p_success)

bernoulli_lcdf(x, p_success)

bernoulli_quantile(p, p_success)
```

## Arguments

- p_success:

  Probability of success (0 \<= p_success \<= 1).

- x:

  Quantile value (must be 0 or 1).

- p:

  Probability (0 \<= p \<= 1).

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/bernoulli_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Bernoulli distribution with p_success = 0.5
dist <- bernoulli_distribution(0.5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.8183099
logcdf(dist, 0.5)
#> [1] -0.2005142
pdf(dist, 0.5)
#> [1] 0.6366198
logpdf(dist, 0.5)
#> [1] -0.4515827
hazard(dist, 0.5)
#> [1] 3.503877
chf(dist, 0.5)
#> [1] 1.705453
mean(dist)
#> [1] 0.5
median(dist)
#> [1] 0
mode(dist)
#> [1] 1
range(dist)
#> [1] 0 1
quantile(dist, 0.2)
#> [1] 0
standard_deviation(dist)
#> [1] 0.5
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.25
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 1
kurtosis_excess(dist)
#> [1] -2

# Convenience functions
bernoulli_pdf(1, 0.5)
#> [1] 0.5
bernoulli_lpdf(1, 0.5)
#> [1] -0.6931472
bernoulli_cdf(1, 0.5)
#> [1] 1
bernoulli_lcdf(1, 0.5)
#> [1] 0
bernoulli_quantile(0.5, 0.5)
#> [1] 0
```
