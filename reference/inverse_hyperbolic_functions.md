# Inverse Hyperbolic Functions

Functions to compute the inverse hyperbolic functions with high
precision and proper handling of edge cases.

- `acosh_boost(x)`: Inverse hyperbolic cosine,
  \\\text{cosh}^{-1}(\text{cosh} (x)) = x\\

- `asinh_boost(x)`: Inverse hyperbolic sine,
  \\\text{sinh}^{-1}(\text{sinh} (x)) = x\\

- `atanh_boost(x)`: Inverse hyperbolic tangent,
  \\\text{tanh}^{-1}(\text{tanh} (x)) = x\\

## Usage

``` r
acosh_boost(x)

asinh_boost(x)

atanh_boost(x)
```

## Arguments

- x:

  Input numeric value (domain depends on the function)

## Value

A single numeric value with the computed inverse hyperbolic function.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/inv_hyper.html)
for more details on the mathematical background.

## Examples

``` r
# Inverse Hyperbolic Cosine (x >= 1)
acosh_boost(2)  # Returns approximately 1.317
#> [1] 1.316958
# Inverse Hyperbolic Sine (all real x)
asinh_boost(1)  # Returns approximately 0.881
#> [1] 0.8813736
# Inverse Hyperbolic Tangent (|x| < 1)
atanh_boost(0.5)  # Returns approximately 0.549
#> [1] 0.5493061
```
