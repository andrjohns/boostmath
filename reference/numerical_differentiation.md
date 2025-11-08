# Numerical Differentiation

Functions for numerical differentiation using finite difference methods
and complex step methods.

## Usage

``` r
finite_difference_derivative(f, x, order = 1)

complex_step_derivative(f, x)
```

## Arguments

- f:

  A function to differentiate. It should accept a single numeric value
  and return a single numeric value.

- x:

  The point at which to evaluate the derivative.

- order:

  The order of accuracy of the derivative to compute. Default is 1.

## Value

The approximate value of the derivative at the point `x`.

## Examples

``` r
# Finite difference derivative of sin(x) at pi/4
finite_difference_derivative(sin, pi / 4)
#> [1] 0.7071068
# Complex step derivative of exp(x) at 1.7
complex_step_derivative(exp, 1.7)
#> [1] 5.473947
```
