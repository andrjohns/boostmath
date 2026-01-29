# Numerical Differentiation

Functions for numerical differentiation using finite difference and
complex step methods.

**Finite Difference Derivative:** Calculates a finite-difference
approximation to the derivative of a function \\f\\ at point \\x\\. This
problem is ill-conditioned: truncation error (\\O(h^k)\\) decreases with
\\h\\, but roundoff error increases. The function balances these errors
automatically. The default order is 6. Requires the function to be
differentiable (up to the order requested).

**Complex Step Derivative:** Computes the derivative of a real-valued
function \\f(x)\\ using the complex step approximation: \$\$f'(x)
\approx \frac{\Im(f(x + ih))}{h}\$\$ This method avoids the subtractive
cancellation error inherent in finite differences and is extremely
accurate. However, it requires \\f\\ to be a holomorphic function
(complex-differentiable) that takes real values at real arguments.
Ideally, the function `f` should be able to accept a complex argument.

## Usage

``` r
finite_difference_derivative(f, x, order = 1)

complex_step_derivative(f, x)
```

## Arguments

- f:

  A function to differentiate. It should accept a single numeric/complex
  value and return a single numeric/complex value.

- x:

  The point at which to evaluate the derivative.

- order:

  The order of accuracy of the finite difference method. Can be 1, 2, 4,
  6, or 8. Default is 1.

## Value

The approximate value of the derivative at the point `x`.

## See also

[`numerical_integration`](https://andrjohns.github.io/boostmath/reference/numerical_integration.md)

## Examples

``` r
# Finite difference derivative of sin(x) at pi/4
finite_difference_derivative(sin, pi / 4)
#> [1] 0.7071068

# Complex step derivative of exp(x) at 1.7 (Requires f to handle complex input ideally)
# Note: In pure R, `exp` handles complex numbers automatically.
complex_step_derivative(exp, 1.7)
#> [1] 5.473947
```
