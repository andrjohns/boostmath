# Logistic Functions

Functions to compute the logistic sigmoid function and its inverse, the
logit function.

These functions are fundamental in statistics, machine learning, and
probability theory, particularly in logistic regression and neural
networks.

**Logistic Sigmoid Function:**

- `logistic_sigmoid(x)`: \\\sigma(x) = \frac{1}{1 + e^{-x}} =
  \frac{e^x}{1 + e^x}\\

**Logit Function:**

- `logit(x)`: \$\$logit(x) = \log\left(\frac{x}{1 - x}\right)\$\$

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
logistic_sigmoid(0)     # Returns 0.5
#> [1] 0.5
logistic_sigmoid(2)     # Returns ~0.881
#> [1] 0.8807971
logistic_sigmoid(-2)    # Returns ~0.119
#> [1] 0.1192029

# Logit Function (inverse of sigmoid)
logit(0.5)              # Returns 0
#> [1] 0
logit(0.7)              # Returns ~0.847
#> [1] 0.8472979
logit(0.881)            # Returns ~2 (inverse of sigmoid(2))
#> [1] 2.001934
```
