# Student's T Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Student's t
distribution.

Student's t-distribution is defined as the distribution of the random
variable \\t\\ which is (very loosely) the "best" that we can do while
not knowing the true standard deviation of the sample.

Given \\N\\ independent measurements, let \$\$t = \frac{\mu - M}{s /
\sqrt{N}}\$\$ where \\M\\ is the population mean, \\\mu\\ is the sample
mean, and \\s\\ is the sample variance.

It has the PDF: \$\$f(x;\nu) =
\frac{\Gamma((\nu+1)/2)}{\sqrt{\nu\pi}\Gamma(\nu/2)}
\left(1+\frac{x^2}{\nu}\right)^{-(\nu+1)/2}\$\$ where \\\nu\\ is the
degrees of freedom.

**Accuracy and Implementation Notes:** The Student's t distribution is
implemented in terms of the incomplete beta function and its inverses.

## Usage

``` r
students_t_distribution(df = 1)

students_t_pdf(x, df = 1)

students_t_lpdf(x, df = 1)

students_t_cdf(x, df = 1)

students_t_lcdf(x, df = 1)

students_t_quantile(p, df = 1)

students_t_find_degrees_of_freedom(
  difference_from_mean,
  alpha,
  beta,
  sd,
  hint = 100
)
```

## Arguments

- df:

  degrees of freedom (default is 1)

- x:

  quantile

- p:

  probability (0 \<= p \<= 1)

- difference_from_mean:

  The difference from the assumed nominal mean that is to be detected.

- alpha:

  The acceptable probability of a Type I error (false positive).

- beta:

  The acceptable probability of a Type II error (false negative).

- sd:

  The assumed standard deviation.

- hint:

  An initial guess for the degrees of freedom to start the search from
  (current sample size is a good start).

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/students_t_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Student's t distribution with 5 degrees of freedom
dist <- students_t_distribution(5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6808506
logcdf(dist, 0.5)
#> [1] -0.3844124
pdf(dist, 0.5)
#> [1] 0.3279185
logpdf(dist, 0.5)
#> [1] -1.11499
hazard(dist, 0.5)
#> [1] 1.027476
chf(dist, 0.5)
#> [1] 1.142096
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.9195438
standard_deviation(dist)
#> [1] 1.290994
support(dist)
#> [1] -Inf  Inf
variance(dist)
#> [1] 1.666667
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 9
kurtosis_excess(dist)
#> [1] 6

# Convenience functions
students_t_pdf(0, 5)
#> [1] 0.3796067
students_t_lpdf(0, 5)
#> [1] -0.9686196
students_t_cdf(0, 5)
#> [1] 0.5
students_t_lcdf(0, 5)
#> [1] -0.6931472
students_t_quantile(0.5, 5)
#> [1] 0

# Find degrees of freedom needed to detect a difference from mean of 2.0
# with alpha = 0.05 and beta = 0.2 when the standard deviation is 3.0
students_t_find_degrees_of_freedom(2.0, 0.05, 0.2, 3.0)
#> [1] 14.49448
```
