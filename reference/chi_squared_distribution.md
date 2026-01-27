# Chi-Squared Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Chi-Squared
distribution.

the PDF is:

\$\$f(x;k) = \frac{x^{k/2-1}e^{-x/2}}{2^{k/2}\Gamma(\frac{k}{2})}\$\$

The CDF is:

\$\$F(x;k) = P(\frac{k}{2},\frac{x}{2})\$\$

Where \\P(s,t)\\ is the regularised gamma function

## Usage

``` r
chi_squared_distribution(df)

chi_squared_pdf(x, df)

chi_squared_lpdf(x, df)

chi_squared_cdf(x, df)

chi_squared_lcdf(x, df)

chi_squared_quantile(p, df)

chi_squared_find_degrees_of_freedom(
  difference_from_variance,
  alpha,
  beta,
  variance,
  hint = 100
)
```

## Arguments

- df:

  degrees of freedom (df \> 0)

- x:

  quantile

- p:

  probability (0 \<= p \<= 1)

- difference_from_variance:

  The difference from the assumed nominal variance that is to be
  detected: Note that the sign of this value is critical (see the
  documentation for more details).

- alpha:

  The acceptable probability of a Type I error (false positive).

- beta:

  The acceptable probability of a Type II error (false negative).

- variance:

  The assumed nominal variance.

- hint:

  An initial guess for the degrees of freedom to start the search from
  (current sample size is a good start).

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/chi_squared_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Chi-Squared distribution with 3 degrees of freedom
dist <- chi_squared_distribution(3)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.08110859
logcdf(dist, 0.5)
#> [1] -2.511966
pdf(dist, 0.5)
#> [1] 0.2196956
logpdf(dist, 0.5)
#> [1] -1.515512
hazard(dist, 0.5)
#> [1] 0.2390877
chf(dist, 0.5)
#> [1] 0.08458732
mean(dist)
#> [1] 3
median(dist)
#> [1] 2.365974
mode(dist)
#> [1] 1
range(dist)
#> [1]   0 Inf
quantile(dist, 0.2)
#> [1] 1.005174
standard_deviation(dist)
#> [1] 2.44949
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 6
skewness(dist)
#> [1] 1.632993
kurtosis(dist)
#> [1] 7
kurtosis_excess(dist)
#> [1] 4

# Convenience functions
chi_squared_pdf(2, 3)
#> [1] 0.2075537
chi_squared_lpdf(2, 3)
#> [1] -1.572365
chi_squared_cdf(2, 3)
#> [1] 0.4275933
chi_squared_lcdf(2, 3)
#> [1] -0.8495828
chi_squared_quantile(0.5, 3)
#> [1] 2.365974

# Find degrees of freedom needed to detect a difference from variance of 2.0
# with alpha = 0.05 and beta = 0.2 when the nominal variance is 5.0
chi_squared_find_degrees_of_freedom(2.0, 0.05, 0.2, 5.0)
#> [1] 106.0113
```
