# Cardinal Cubic B-Spline Interpolator

The cardinal cubic B-spline interpolator allows for fast and accurate
interpolation of a function which is known at equally spaced points.

**Mathematical Properties:**

It uses compactly supported basis functions constructed via iterative
convolution, ensuring numerical stability. The interpolant is O(h^4)
accurate for values and O(h^3) accurate for derivatives, where h is the
step size.

**Conditions:**

Ideally, the function being interpolated should be four-times
continuously differentiable. If the derivatives at the endpoints are not
provided, they are estimated using one-sided finite-difference formulas.

## Usage

``` r
cardinal_cubic_b_spline(
  y,
  t0,
  h,
  left_endpoint_derivative = NULL,
  right_endpoint_derivative = NULL
)
```

## Arguments

- y:

  Numeric vector of data points to interpolate.

- t0:

  Numeric scalar representing the starting point of the data.

- h:

  Numeric scalar representing the spacing between data points.

- left_endpoint_derivative:

  Optional numeric scalar for the derivative at the left endpoint.

- right_endpoint_derivative:

  Optional numeric scalar for the derivative at the right endpoint.

## Value

An object of class `cardinal_cubic_b_spline` with methods:

- `interpolate(x)`: Evaluate the spline at point `x`.

- `prime(x)`: Evaluate the first derivative of the spline at point `x`.

- `double_prime(x)`: Evaluate the second derivative of the spline at
  point `x`.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cardinal_cubic_b.html)

## Examples

``` r
y <- c(1, 2, 0, 2, 1)
t0 <- 0
h <- 1
spline_obj <- cardinal_cubic_b_spline(y, t0, h)
x <- 0.5
spline_obj$interpolate(x)
#> [1] 2.895833
spline_obj$prime(x)
#> [1] 0.125
spline_obj$double_prime(x)
#> [1] -11.16667
```
