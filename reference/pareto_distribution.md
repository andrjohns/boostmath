# Pareto Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Pareto
distribution.

The Pareto distribution is a continuous distribution that often
describes the larger compared to the smaller. A classic example is that
80% of the wealth is owned by 20% of the population.

It has the probability density function (PDF): \$\$f(x; \alpha, \beta) =
\frac{\alpha\beta^\alpha}{x^{\alpha+1}}\$\$ for shape parameter \\\alpha
\> 0\\, scale parameter \\\beta \> 0\\, and \\x \ge \beta\\. If \\x \<
\beta\\, the pdf is zero.

**Accuracy and Implementation Notes:** The Pareto distribution is
implemented in terms of the standard library `exp` functions plus
`expm1` and so should have very small errors, usually only a few
epsilon.

## Usage

``` r
pareto_distribution(scale = 1, shape = 1)

pareto_pdf(x, scale = 1, shape = 1)

pareto_lpdf(x, scale = 1, shape = 1)

pareto_cdf(x, scale = 1, shape = 1)

pareto_lcdf(x, scale = 1, shape = 1)

pareto_quantile(p, scale = 1, shape = 1)
```

## Arguments

- scale:

  scale parameter (default is 1)

- shape:

  shape parameter (default is 1)

- x:

  quantile

- p:

  probability (0 \<= p \<= 1)

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/pareto.html)
for more details on the mathematical background.

## Examples

``` r
# Pareto distribution with scale = 10, shape = 5
dist <- pareto_distribution(10, 5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0
logcdf(dist, 0.5)
#> [1] -Inf
pdf(dist, 0.5)
#> [1] 0
logpdf(dist, 0.5)
#> [1] -Inf
hazard(dist, 0.5)
#> [1] 0
chf(dist, 0.5)
#> [1] 0
mean(dist)
#> [1] 12.5
median(dist)
#> [1] 11.48698
mode(dist)
#> [1] 10
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 10.4564
standard_deviation(dist)
#> [1] 3.227486
support(dist)
#> [1]  1.000000e+01 1.797693e+308
variance(dist)
#> [1] 10.41667
skewness(dist)
#> [1] 4.64758
kurtosis(dist)
#> [1] 73.8
kurtosis_excess(dist)
#> [1] 70.8

# Convenience functions
pareto_pdf(1)
#> [1] 1
pareto_lpdf(1)
#> [1] 0
pareto_cdf(1)
#> [1] 0
pareto_lcdf(1)
#> [1] -Inf
pareto_quantile(0.5)
#> [1] 2
```
