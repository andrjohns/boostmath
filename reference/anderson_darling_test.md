# Anderson-Darling Test for Normality

Performs the Anderson-Darling test for normality by computing the
\\A^2\\ test statistic:

\$\$A^2 =
n\int\_{-\infty}^{\infty}\frac{(F_n(x)-F(x))^2F'(x)}{F(x)(1-F(x))}dx\$\$

The Anderson-Darling test evaluates whether a sample comes from a normal
distribution by computing an integral over the empirical cumulative
distribution function (ECDF) and comparing it against the normal
distribution's CDF.

**Interpretation:**

- When \\A^2/n\\ approaches zero as sample size increases, the normality
  hypothesis is supported

- When \\A^2/n\\ converges to a positive finite value, the normality
  hypothesis lacks support

**Important:** The input data vector `x` must be sorted in ascending
order. Unsorted data will trigger an error.

## Usage

``` r
anderson_darling_normality_statistic(x, mu = 0, sd = 1)
```

## Arguments

- x:

  A numeric vector of sample data (must be sorted in ascending order).

- mu:

  The mean of the normal distribution to test against. Default is 0.

- sd:

  The standard deviation of the normal distribution to test against.
  Default is 1.

## Value

The Anderson-Darling \\A^2\\ test statistic.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/anderson_darling.html)
for more details on the mathematical background.

## Examples

``` r
# Anderson-Darling test for normality with sorted data
x <- sort(rnorm(100))
anderson_darling_normality_statistic(x, 0, 1)
#> [1] 1.071972
```
