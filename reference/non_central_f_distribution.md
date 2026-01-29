# Noncentral F Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Noncentral F
distribution.

The noncentral F distribution is a generalization of the Fisher F
Distribution. It is defined as the ratio \$\$F =
\frac{X/\nu_1}{Y/\nu_2}\$\$ where \\X\\ is a noncentral \\\chi^2\\
random variable with \\\nu_1\\ degrees of freedom and non-centrality
parameter \\\lambda\\, and \\Y\\ is a central \\\chi^2\\ random variable
with \\\nu_2\\ degrees of freedom.

**Accuracy and Implementation Notes:** This distribution is implemented
in terms of the Noncentral Beta Distribution. Refer to the Noncentral
Beta Distribution documentation for details on accuracy and
implementation method.

## Usage

``` r
non_central_f_distribution(df1, df2, lambda)

non_central_f_pdf(x, df1, df2, lambda)

non_central_f_lpdf(x, df1, df2, lambda)

non_central_f_cdf(x, df1, df2, lambda)

non_central_f_lcdf(x, df1, df2, lambda)

non_central_f_quantile(p, df1, df2, lambda)
```

## Arguments

- df1:

  degrees of freedom for the numerator (df1 \> 0)

- df2:

  degrees of freedom for the denominator (df2 \> 0)

- lambda:

  noncentrality parameter (lambda \>= 0)

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/f_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Noncentral F distribution with df1 = 10, df2 = 10 and noncentrality
# parameter 1
dist <- non_central_f_distribution(10, 10, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.1142528
logcdf(dist, 0.5)
#> [1] -2.169342
pdf(dist, 0.5)
#> [1] 0.5754471
logpdf(dist, 0.5)
#> [1] -0.552608
hazard(dist, 0.5)
#> [1] 0.6496742
chf(dist, 0.5)
#> [1] 0.1213237
mean(dist)
#> [1] 1.375
median(dist)
#> [1] 1.10075
mode(dist)
#> [1] 0.7349843
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.6363179
standard_deviation(dist)
#> [1] 1.063113
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 1.130208
skewness(dist)
#> [1] 3.609738
kurtosis(dist)
#> [1] 51.0825
kurtosis_excess(dist)
#> [1] 48.0825

# Convenience functions
non_central_f_pdf(1, 5, 2, 1)
#> [1] 0.3051418
non_central_f_lpdf(1, 5, 2, 1)
#> [1] -1.186979
non_central_f_cdf(1, 5, 2, 1)
#> [1] 0.3737987
non_central_f_lcdf(1, 5, 2, 1)
#> [1] -0.9840377
non_central_f_quantile(0.5, 5, 2, 1)
#> [1] 1.507635
```
