# Inverse Chi-Squared Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Inverse Chi-Squared
distribution.

## Usage

``` r
inverse_chi_squared_distribution(df = 1, scale = 1/df)

inverse_chi_squared_pdf(x, df = 1, scale = 1/df)

inverse_chi_squared_lpdf(x, df = 1, scale = 1/df)

inverse_chi_squared_cdf(x, df = 1, scale = 1/df)

inverse_chi_squared_lcdf(x, df = 1, scale = 1/df)

inverse_chi_squared_quantile(p, df = 1, scale = 1/df)
```

## Arguments

- df:

  degrees of freedom (df \> 0; default is 1)

- scale:

  scale parameter (default is 1/df)

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_chi_squared_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Inverse Chi-Squared distribution with 10 degrees of freedom, scale = 1
dist <- inverse_chi_squared_distribution(10, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.02925269
logcdf(dist, 0.5)
#> [1] -3.531784
pdf(dist, 0.5)
#> [1] 0.3783327
logpdf(dist, 0.5)
#> [1] -0.9719812
hazard(dist, 0.5)
#> [1] 0.3897335
chf(dist, 0.5)
#> [1] 0.02968908
mean(dist)
#> [1] 1.25
median(dist)
#> [1] 1.070455
mode(dist)
#> [1] 0.8333333
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.7439393
standard_deviation(dist)
#> [1] 0.7216878
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 0.5208333
skewness(dist)
#> [1] 3.464102
kurtosis(dist)
#> [1] 45
kurtosis_excess(dist)
#> [1] 42

# Convenience functions
inverse_chi_squared_pdf(2, 10, 1)
#> [1] 0.1670024
inverse_chi_squared_lpdf(2, 10, 1)
#> [1] -1.789747
inverse_chi_squared_cdf(2, 10, 1)
#> [1] 0.891178
inverse_chi_squared_lcdf(2, 10, 1)
#> [1] -0.1152111
inverse_chi_squared_quantile(0.5, 10, 1)
#> [1] 1.070455
```
