# Fisher F Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Fisher F
distribution.

If \$\$X_1 \sim \chi^2\_{\nu_1}\$\$ and \$\$X_2 \sim \chi^2\_{\nu_2}\$\$
are independent, then \$\$F = (X_1/\nu_1)/(X_2/\nu_2)\$\$ has an F
distribution. The PDF is

\$\$f(x) = \frac{\sqrt{\frac{(\nu_1 x)^{\nu_1} \nu_2^{\nu_2}}{(\nu_1 x +
\nu_2)^{\nu_1 + \nu_2}}}}{x\\B(\nu_1/2, \nu_2/2)}\$\$

and the CDF is expressed via incomplete beta functions.

**Accuracy and Implementation Notes:** The CDF and quantiles are
implemented in terms of the incomplete beta function and its inverses.
The PDF is evaluated using stable formulations based on
`ibeta_derivative` with branch selection to avoid loss of accuracy when
the beta argument is near 1.

## Usage

``` r
fisher_f_distribution(df1, df2)

fisher_f_pdf(x, df1, df2)

fisher_f_lpdf(x, df1, df2)

fisher_f_cdf(x, df1, df2)

fisher_f_lcdf(x, df1, df2)

fisher_f_quantile(p, df1, df2)
```

## Arguments

- df1:

  Degrees of freedom for the numerator (df1 \> 0).

- df2:

  Degrees of freedom for the denominator (df2 \> 0).

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/f_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Fisher F distribution with df1 = 5, df2 = 10
dist <- fisher_f_distribution(5, 10)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.2299751
logcdf(dist, 0.5)
#> [1] -1.469784
pdf(dist, 0.5)
#> [1] 0.687607
logpdf(dist, 0.5)
#> [1] -0.3745378
hazard(dist, 0.5)
#> [1] 0.8929673
chf(dist, 0.5)
#> [1] 0.2613325
mean(dist)
#> [1] 1.25
median(dist)
#> [1] 0.9319332
mode(dist)
#> [1] 0.5
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.4563364
standard_deviation(dist)
#> [1] 1.163687
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 1.354167
skewness(dist)
#> [1] 3.86702
kurtosis(dist)
#> [1] 53.86154
kurtosis_excess(dist)
#> [1] 50.86154

# Convenience functions
fisher_f_pdf(1, 5, 10)
#> [1] 0.4954798
fisher_f_lpdf(1, 5, 10)
#> [1] -0.7022287
fisher_f_cdf(1, 5, 10)
#> [1] 0.5348806
fisher_f_lcdf(1, 5, 10)
#> [1] -0.6257118
fisher_f_quantile(0.5, 5, 10)
#> [1] 0.9319332
```
