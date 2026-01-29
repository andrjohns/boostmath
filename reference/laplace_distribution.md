# Laplace Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Laplace (double
exponential) distribution.

With location \$\$\mu\$\$ and scale \$\$\sigma \> 0\$\$, the PDF is

\$\$f(x) =
\frac{1}{2\sigma}\exp\left(-\frac{\|x-\mu\|}{\sigma}\right)\$\$

and the CDF is

\$\$F(x) =
\begin{cases}\frac{1}{2}\exp\left(\frac{x-\mu}{\sigma}\right), & x \<
\mu,\\ 1 - \frac{1}{2}\exp\left(\frac{\mu-x}{\sigma}\right), & x \ge
\mu.\end{cases}\$\$

**Accuracy and Implementation Notes:** Implemented in terms of `exp` and
`log`; `logcdf` and `logpdf` are specialised for improved numerical
accuracy. Complements use stable `log1p` forms.

## Usage

``` r
laplace_distribution(location = 0, scale = 1)

laplace_pdf(x, location = 0, scale = 1)

laplace_lpdf(x, location = 0, scale = 1)

laplace_cdf(x, location = 0, scale = 1)

laplace_lcdf(x, location = 0, scale = 1)

laplace_quantile(p, location = 0, scale = 1)
```

## Arguments

- location:

  Location parameter (default is 0).

- scale:

  Scale parameter (default is 1).

- x:

  Quantile value.

- p:

  Probability (0 \<= p \<= 1).

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/laplace_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Laplace distribution with location = 0, scale = 1
dist <- laplace_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6967347
logcdf(dist, 0.5)
#> [1] -0.3613506
pdf(dist, 0.5)
#> [1] 0.3032653
logpdf(dist, 0.5)
#> [1] -1.193147
hazard(dist, 0.5)
#> [1] 1
chf(dist, 0.5)
#> [1] 1.193147
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.9162907
standard_deviation(dist)
#> [1] 1.414214
support(dist)
#> [1] -Inf  Inf
variance(dist)
#> [1] 2
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 6
kurtosis_excess(dist)
#> [1] 3

# Convenience functions
laplace_pdf(0)
#> [1] 0.5
laplace_lpdf(0)
#> [1] -0.6931472
laplace_cdf(0)
#> [1] 0.5
laplace_lcdf(0)
#> [1] -0.6931472
laplace_quantile(0.5)
#> [1] 0
```
