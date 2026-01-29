# Logistic Functions

Functions to compute the logistic sigmoid function and its inverse, the
logit function.

These functions are fundamental in statistics, machine learning, and
probability theory, particularly in logistic regression and neural
networks.

**Logistic Sigmoid Function:**

The logistic sigmoid (also called the logistic function or expit) is
defined as: \$\$\sigma(x) = \frac{1}{1 + e^{-x}} = \frac{e^x}{1 +
e^x}\$\$

- `logistic_sigmoid(x)`: Computes sigma(x)

- Domain: (-Inf, Inf)

- Range: (0, 1)

- S-shaped (sigmoid) curve

- Symmetric around x = 0: sigma(-x) = 1 - sigma(x)

- Special values:

  - sigma(0) = 0.5

  - sigma(Inf) = 1

  - sigma(-Inf) = 0

- Derivative: sigma'(x) = sigma(x)(1 - sigma(x))

**Applications:**

- Activation function in neural networks

- Models probability in logistic regression

- Converts log-odds to probabilities

- Smooth approximation to step functions

**Logit Function:**

The logit function (log-odds or inverse sigmoid) is defined as:
\$\$logit(p) = \log\left(\frac{p}{1 - p}\right)\$\$

- `logit(x)`: Computes logit(x) = log(x/(1-x))

- Domain: (0, 1)

- Range: (-Inf, Inf)

- Inverse of the logistic sigmoid: logit(sigma(x)) = x

- Odd function around p = 0.5: logit(1 - p) = -logit(p)

- Special values:

  - logit(0.5) = 0

  - logit(0) = -Inf

  - logit(1) = Inf

- Derivative: d/dp logit(p) = 1/(p(1-p))

**Applications:**

- Converts probabilities to log-odds scale

- Link function in logistic regression

- Transforms bounded quantities to unbounded scale

- Used in odds ratio calculations

**Numerical Stability:**

Both functions use numerically stable implementations that avoid
overflow/underflow for extreme values of their arguments.

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
