# Logistic Functions

Functions to compute the logit and logistic sigmoid functions

## Usage

``` r
logistic_sigmoid(x)

logit(x)
```

## Arguments

- x:

  Numeric value for which to compute the functions

## Value

A single numeric value with the computed logit or logistic sigmoid
function.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/logistic.html)
for more details on the mathematical background.

## Examples

``` r
# Logistic Sigmoid Function
logistic_sigmoid(0.5)
#> [1] 0.6224593
# Logit Function
logit(0.7)
#> [1] 0.8472979
```
