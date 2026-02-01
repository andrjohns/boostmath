# Hyperexponential Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Hyperexponential
distribution.

A \$k\$-phase hyperexponential distribution is a mixture of \\k\\
exponential distributions with phase probabilities \\\alpha_i\\ and
rates \\\lambda_i\\. The PDF and CDF are

\$\$f(x; \alpha, \lambda) = \sum\_{i=1}^k \alpha_i \lambda_i
e^{-\lambda_i x}\$\$ \$\$F(x; \alpha, \lambda) = 1 - \sum\_{i=1}^k
\alpha_i e^{-\lambda_i x}\$\$.

## Usage

``` r
hyperexponential_distribution(probabilities, rates)

hyperexponential_pdf(x, probabilities, rates)

hyperexponential_lpdf(x, probabilities, rates)

hyperexponential_cdf(x, probabilities, rates)

hyperexponential_lcdf(x, probabilities, rates)

hyperexponential_quantile(p, probabilities, rates)
```

## Arguments

- probabilities:

  Vector of non-negative probabilities (will be normalised to sum to 1).

- rates:

  Vector of positive rates (all rates must be \> 0).

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/hyperexponential_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Hyperexponential distribution with probabilities = c(0.5, 0.5) and rates = c(1, 2)
dist <- hyperexponential_distribution(c(0.5, 0.5), c(1, 2))
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5127949
logcdf(dist, 0.5)
#> [1] -0.6678792
pdf(dist, 0.5)
#> [1] 0.6711448
logpdf(dist, 0.5)
#> [1] -0.3987704
hazard(dist, 0.5)
#> [1] 1.377541
chf(dist, 0.5)
#> [1] 0.7190702
mean(dist)
#> [1] 0.75
median(dist)
#> [1] 0.4812118
mode(dist)
#> [1] 0
range(dist)
#> [1]   0 Inf
quantile(dist, 0.2)
#> [1] 0.1506519
standard_deviation(dist)
#> [1] 0.8291562
support(dist)
#> [1] 2.225074e-308 1.797693e+308
variance(dist)
#> [1] 0.6875
skewness(dist)
#> [1] 2.466911
kurtosis(dist)
#> [1] 12.47107
kurtosis_excess(dist)
#> [1] 9.471074

# Convenience functions
hyperexponential_pdf(2, c(0.5, 0.5), c(1, 2))
#> [1] 0.08598328
hyperexponential_lpdf(2, c(0.5, 0.5), c(1, 2))
#> [1] -2.453602
hyperexponential_cdf(2, c(0.5, 0.5), c(1, 2))
#> [1] 0.9231745
hyperexponential_lcdf(2, c(0.5, 0.5), c(1, 2))
#> [1] -0.07993696
hyperexponential_quantile(0.5, c(0.5, 0.5), c(1, 2))
#> [1] 0.4812118
```
