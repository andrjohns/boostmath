# Skew Normal Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Skew Normal
distribution.

The skew normal distribution is a variant of the most well known
Gaussian statistical distribution. If the standard (mean = 0, scale = 1)
normal distribution probability density function is \\\phi(x)\\ and the
cumulative distribution function is \\\Phi(x)\\, then the PDF of the
skew normal distribution with shape parameter \\\alpha\\ is:
\$\$f(x;\alpha) = 2\phi(x)\Phi(\alpha x)\$\$

Given location \\\xi\\, scale \\\omega\\, and shape \\\alpha\\, it can
be transformed to: \$\$f(x) =
\frac{2}{\omega}\phi\left(\frac{x-\xi}{\omega}\right)\Phi\left(\alpha\frac{x-\xi}{\omega}\right)\$\$

**Accuracy and Implementation Notes:** The skew_normal distribution with
shape = zero is equivalent to the normal distribution and uses the error
function for excellent accuracy. The CDF requires Owen's T function,
which is evaluated using algoritms by Patefield and Tandy. The median
and mode are calculated by iterative root finding and may be less
accurate than other estimates.

## Usage

``` r
skew_normal_distribution(location = 0, scale = 1, shape = 0)

skew_normal_pdf(x, location = 0, scale = 1, shape = 0)

skew_normal_lpdf(x, location = 0, scale = 1, shape = 0)

skew_normal_cdf(x, location = 0, scale = 1, shape = 0)

skew_normal_lcdf(x, location = 0, scale = 1, shape = 0)

skew_normal_quantile(p, location = 0, scale = 1, shape = 0)
```

## Arguments

- location:

  location parameter (default is 0)

- scale:

  scale parameter (default is 1)

- shape:

  shape parameter (default is 0)

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
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/skew_normal_dist.html)
for more details on the mathematical background.

## Examples

``` r
# Skew Normal distribution with location = 0, scale = 1, shape = 0
dist <- skew_normal_distribution(0, 1, 0)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6914625
logcdf(dist, 0.5)
#> [1] -0.3689464
pdf(dist, 0.5)
#> [1] 0.3520653
logpdf(dist, 0.5)
#> [1] -1.043939
hazard(dist, 0.5)
#> [1] 1.141078
chf(dist, 0.5)
#> [1] 1.175912
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.8416212
standard_deviation(dist)
#> [1] 1
support(dist)
#> [1] -1.797693e+308  1.797693e+308
variance(dist)
#> [1] 1
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 3
kurtosis_excess(dist)
#> [1] 0

# Convenience functions
skew_normal_pdf(0)
#> [1] 0.3989423
skew_normal_lpdf(0)
#> [1] -0.9189385
skew_normal_cdf(0)
#> [1] 0.5
skew_normal_lcdf(0)
#> [1] -0.6931472
skew_normal_quantile(0.5)
#> [1] 0
```
