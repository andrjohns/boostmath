# Linear Regression Functions

Functions to perform simple ordinary least squares (OLS) linear
regression.

The OLS fit finds \$c_0\$ and \$c_1\$ that minimize

\$\$\sum\_{i=1}^n (y_i - (c_0 + c_1 x_i))^2\$\$

producing the model \$f(x)=c_0+c_1x\$. The optional \$R^2\$ output uses

\$\$R^2 = 1 - \frac{\sum_i (y_i - \hat{y}\_i)^2}{\sum_i (y_i -
\bar{y})^2}\$\$

**Accuracy and Implementation Notes:** Boost uses a numerically stable
one-pass approach based on means, variances, and covariances to reduce
cancellation error.

## Usage

``` r
simple_ordinary_least_squares(x, y)

simple_ordinary_least_squares_with_R_squared(x, y)
```

## Arguments

- x:

  A numeric vector.

- y:

  A numeric vector.

## Value

A two-element numeric vector containing the intercept and slope of the
regression line, or a three-element vector containing the intercept,
slope, and R-squared value if applicable.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/linear_regression.html)
for more details on the mathematical background.

## Examples

``` r
# Simple Ordinary Least Squares
x <- c(1, 2, 3, 4, 5)
y <- c(2, 3, 5, 7, 11)
simple_ordinary_least_squares(x, y)
#> [1] -1.0  2.2
# Simple Ordinary Least Squares with R-squared
simple_ordinary_least_squares_with_R_squared(x, y)
#> [1] -1.0000000  2.2000000  0.9453125
```
