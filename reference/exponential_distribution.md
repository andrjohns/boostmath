# Exponential Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Exponential
distribution.

With rate parameter \$\$\lambda \> 0\$\$, the PDF and CDF are

\$\$f(x) = \lambda e^{-\lambda x}, \quad x \ge 0\$\$ \$\$F(x) = 1 -
e^{-\lambda x}\$\$

and the quantile is

\$\$Q(p) = -\frac{\log(1-p)}{\lambda}\$\$.

**Accuracy and Implementation Notes:** The implementation uses `exp`,
`log`, `expm1`, and `log1p`. Both `logcdf` and `logpdf` are specialised
for improved numerical accuracy, and complements use stable forms.

## Usage

``` r
exponential_distribution(lambda = 1)

exponential_pdf(x, lambda = 1)

exponential_lpdf(x, lambda = 1)

exponential_cdf(x, lambda = 1)

exponential_lcdf(x, lambda = 1)

exponential_quantile(p, lambda = 1)
```

## Arguments

- lambda:

  Rate parameter (lambda \> 0).

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/exp_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Exponential distribution with rate parameter lambda = 2
dist <- exponential_distribution(2)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6321206
logcdf(dist, 0.5)
#> [1] -0.4586751
pdf(dist, 0.5)
#> [1] 0.7357589
logpdf(dist, 0.5)
#> [1] -0.3068528
hazard(dist, 0.5)
#> [1] 2
chf(dist, 0.5)
#> [1] 1
mean(dist)
#> [1] 0.5
median(dist)
#> [1] 0.3465736
mode(dist)
#> [1] 0
range(dist)
#> [1]   0 Inf
quantile(dist, 0.2)
#> [1] 0.1115718
standard_deviation(dist)
#> [1] 0.5
support(dist)
#> [1] 2.225074e-308 1.797693e+308
variance(dist)
#> [1] 0.25
skewness(dist)
#> [1] 2
kurtosis(dist)
#> [1] 9
kurtosis_excess(dist)
#> [1] 6

# Convenience functions
exponential_pdf(1, 2)
#> [1] 0.2706706
exponential_lpdf(1, 2)
#> [1] -1.306853
exponential_cdf(1, 2)
#> [1] 0.8646647
exponential_lcdf(1, 2)
#> [1] -0.1454135
exponential_quantile(0.5, 2)
#> [1] 0.3465736
```
