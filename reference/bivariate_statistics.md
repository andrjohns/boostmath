# Bivariate Statistics Functions

Functions to compute bivariate statistics including covariance and the
Pearson correlation coefficient.

**Covariance:** The population covariance is

\$\$\operatorname{cov}(x, y) = \frac{1}{n}\sum\_{i=1}^n (x_i -
\bar{x})(y_i - \bar{y})\$\$

**Correlation Coefficient:** The Pearson correlation coefficient is

\$\$\rho\_{x,y} = \frac{\operatorname{cov}(x, y)}{\sigma_x \sigma_y}\$\$

## Usage

``` r
covariance(x, y)

means_and_covariance(x, y)

correlation_coefficient(x, y)
```

## Arguments

- x:

  A numeric vector.

- y:

  A numeric vector.

## Value

A numeric value (or tuple for `means_and_covariance`) with the computed
statistic.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bivariate_statistics.html)
for more details on the mathematical background.

## Examples

``` r
# Covariance
covariance(c(1, 2, 3), c(4, 5, 6))
#> [1] 0.6666667
# Means and Covariance
means_and_covariance(c(1, 2, 3), c(4, 5, 6))
#> [1] 2.0000000 5.0000000 0.6666667
# Correlation Coefficient
correlation_coefficient(c(1, 2, 3), c(4, 5, 6))
#> [1] 1
```
