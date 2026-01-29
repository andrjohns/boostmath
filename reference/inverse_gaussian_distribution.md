# Inverse Gaussian Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Inverse Gaussian
(Inverse Normal) distribution.

With mean \$\$\mu\$\$ and scale \$\$\lambda\$\$, the PDF is

\$\$f(x;\mu,\lambda) = \sqrt{\frac{\lambda}{2\pi
x^3}}\exp\left(-\frac{\lambda(x-\mu)^2}{2\mu^2 x}\right)\$\$

and the CDF is

\$\$F(x) =
\Phi\left(\sqrt{\frac{\lambda}{x}}\left(\frac{x}{\mu}-1\right)\right) +
\exp\left(\frac{2\lambda}{\mu}\right)\Phi\left(-\sqrt{\frac{\lambda}{x}}\left(\frac{x}{\mu}+1\right)\right)\$\$

where \$\$\Phi\$\$ is the standard normal CDF.

**Accuracy and Implementation Notes:** Implemented using the standard
normal distribution and the exponential function. `logpdf` is
specialised for numerical accuracy. Quantiles have no closed form and
are computed via Newton-Raphson refinement.

## Usage

``` r
inverse_gaussian_distribution(mu = 1, lambda = 1)

inverse_gaussian_pdf(x, mu = 1, lambda = 1)

inverse_gaussian_lpdf(x, mu = 1, lambda = 1)

inverse_gaussian_cdf(x, mu = 1, lambda = 1)

inverse_gaussian_lcdf(x, mu = 1, lambda = 1)

inverse_gaussian_quantile(p, mu = 1, lambda = 1)
```

## Arguments

- mu:

  Mean parameter (mu \> 0; default is 1).

- lambda:

  Scale parameter (lambda \> 0; default is 1).

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_gaussian_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Inverse Gaussian distribution with mu = 3, lambda = 4
dist <- inverse_gaussian_distribution(3, 4)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.01617264
logcdf(dist, 0.5)
#> [1] -4.124435
pdf(dist, 0.5)
#> [1] 0.1403174
logpdf(dist, 0.5)
#> [1] -1.963848
hazard(dist, 0.5)
#> [1] 0.142624
chf(dist, 0.5)
#> [1] 0.01630484
mean(dist)
#> [1] 3
median(dist)
#> [1] 2.202698
mode(dist)
#> [1] 1.140598
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 1.161488
standard_deviation(dist)
#> [1] 2.598076
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 6.75
skewness(dist)
#> [1] 2.598076
kurtosis(dist)
#> [1] 8.25
kurtosis_excess(dist)
#> [1] 11.25

# Convenience functions
inverse_gaussian_pdf(2, 3, 4)
#> [1] 0.2524295
inverse_gaussian_lpdf(2, 3, 4)
#> [1] -1.376623
inverse_gaussian_cdf(2, 3, 4)
#> [1] 0.4512408
inverse_gaussian_lcdf(2, 3, 4)
#> [1] -0.7957542
inverse_gaussian_quantile(0.5, 3, 4)
#> [1] 2.202698
```
