# Chatterjee Correlation Function

Compute the Chatterjee correlation coefficient, a rank-based
coefficient:

\$\$\xi_n(X,Y) = 1 - \frac{3\sum\_{i=1}^{n-1}\|r\_{i+1} - r_i\|}{n^2 -
1}\$\$

## Usage

``` r
chatterjee_correlation(x, y)
```

## Arguments

- x:

  A numeric vector.

- y:

  A numeric vector.

## Value

A two-element numeric vector containing the test statistic and the
p-value.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/chatterjee_correlation.html)
for more details on the mathematical background.

## Examples

``` r
x <- c(1, 2, 3, 4, 5)
y <- c(2, 3, 5, 7, 11)
# Chatterjee correlation
chatterjee_correlation(x, y)
#> [1] 0.5
```
