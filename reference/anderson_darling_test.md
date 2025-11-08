# Anderson-Darling Test for Normality

Functions to perform the Anderson-Darling test for normality.

## Usage

``` r
anderson_darling_normality_statistic(x, mu = 0, sd = 1)
```

## Arguments

- x:

  A numeric vector.

- mu:

  A single numeric value.

- sd:

  A single numeric value.

## Value

A numeric value or vector with the computed statistic.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/anderson_darling.html)
for more details on the mathematical background.

## Examples

``` r
# Anderson-Darling test for normality
anderson_darling_normality_statistic(c(1, 2, 3, 4, 5), 0, 1)
#> [1] 19.49684
```
