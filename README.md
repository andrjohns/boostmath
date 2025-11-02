
<!-- README.md is generated from README.Rmd. Please edit that file -->

# boostmath

<!-- badges: start -->

[![R-CMD-check](https://github.com/andrjohns/boostmath/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/andrjohns/boostmath/actions/workflows/R-CMD-check.yaml)
[![CRAN
status](https://www.r-pkg.org/badges/version/boostmath)](https://CRAN.R-project.org/package=boostmath)
[![Downloads](https://cranlogs.r-pkg.org/badges/boostmath?color=blue)](https://CRAN.R-project.org/package=boostmath)
[![boostmath status
badge](https://andrjohns.r-universe.dev/badges/boostmath)](https://andrjohns.r-universe.dev/boostmath)
<!-- badges: end -->

Providing simple access to Boost’s Math functions in R, no compilation
required.

## Installation

You can install the development version of boostmath from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("andrjohns/boostmath")
```

Or you can install pre-built binaries from R-Universe:

``` r
install.packages("boostmath", repos = c("https://andrjohns.r-universe.dev",
                                        "https://cran.r-project.org"))
```

## Usage

Functions can be used directly after loading the package:

``` r
library(boostmath)
#> 
#> Attaching package: 'boostmath'
#> The following object is masked from 'package:grDevices':
#> 
#>     pdf
#> The following object is masked from 'package:base':
#> 
#>     mode

hypergeometric_pFq(c(1, 2.5), c(0.5, 2), 1)
#> [1] 6.675991
ibeta_inv(2.1, 5.2, 0.7)
#> [1] 0.361431
owens_t(2.1, 4.2)
#> [1] 0.00893221
```

Any Boost Math functions that share the same name as R functions are
sufffixed with `_boost` to avoid conflicts:

``` r
beta_boost(3, 2)
#> [1] 0.08333333
lgamma_boost(5)
#> [1] 3.178054
```

## Quadrature and Differentiation

Boost’s integration routines are also available for use with R
functions:

``` r
trapezoidal(function(x) { 1/(5 - 4*cos(x)) }, a = 0, b = 2*pi)
#> [1] 2.094395

gauss_legendre(function(x) { x * x * atan(x) }, a = 0, b = 1, points = 20)
#> [1] 0.2106573

gauss_kronrod(function(x) { exp(-x * x / 2) }, a = 0, b = Inf, points = 15)
#> [1] 1.253314
```

As well as numerical differentiation by finite-differencing or the
complex-step method:

``` r
finite_difference_derivative(exp, 1.7)
#> [1] 5.473947

complex_step_derivative(exp, 1.7)
#> [1] 5.473947
```

## Distribution Functions

`boostmath` implements Boost’s approach of creating a distribution
‘object’ which the various distribution functions (e.g., `pdf`,
`quantile`) can be applied:

``` r
# Normal distribution with mean = 0, sd = 1
dist <- normal_distribution(0, 1)
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
#> [1] -Inf  Inf
variance(dist)
#> [1] 1
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 3
kurtosis_excess(dist)
#> [1] 0
```

Alternatively, the PDF, CDF, log-PDF, log-CDF, and quantile functions
for statistical distributions can just be called directly:

``` r
beta_pdf(0.1, 1.2, 2.1)
#> [1] 1.569287

beta_lpdf(0.1, 1.2, 2.1)
#> [1] 0.4506213

beta_cdf(0.1, 1.2, 2.1)
#> [1] 0.1380638

beta_lcdf(0.1, 1.2, 2.1)
#> [1] -1.98004

beta_quantile(0.5, 1.2, 2.1)
#> [1] 0.3335097
```
