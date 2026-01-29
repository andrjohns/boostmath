# Cardinal Quadratic B-Spline Interpolator

The cardinal quadratic B-spline interpolator is very nearly the same as
the cubic B-spline interpolator, but uses quadratic basis functions.

**Use Cases:**

Basis functions are constructed by convolving a box function with itself
twice. Since the basis functions are less smooth than the cubic
B-spline, this is primarily useful for approximating functions of
reduced smoothness. It is appropriate for functions which are two or
three times continuously differentiable.

## Usage

``` r
cardinal_quadratic_b_spline(
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

An object of class `cardinal_quadratic_b_spline` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cardinal_quadratic_b.html)

## Examples

``` r
y <- c(0, 1, 0, 1)
t0 <- 0
h <- 1
interpolator <- cardinal_quadratic_b_spline(y, t0, h)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.7857143
interpolator$prime(xi)
#> [1] 1.142857
```
