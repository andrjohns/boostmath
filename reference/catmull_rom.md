# Catmull-Rom Interpolation

Catmull-Rom splines are a family of interpolating curves which are
commonly used in computer graphics and animation.

**Properties:**

They enjoy affine invariance, local support, C2-smoothness, and
interpolation of control points. The curve is internally closed, however
the user specifies if it should be treated as open or closed via the
parameters. Evaluation is O(log N).

## Usage

``` r
catmull_rom(control_points, closed = FALSE, alpha = 0.5)
```

## Arguments

- control_points:

  List of control points, where each element is a numeric vector of
  length 3.

- closed:

  Logical indicating whether the spline is closed (i.e., the first and
  last control points are connected), defaults to false

- alpha:

  Numeric scalar for the tension parameter, defaults to 0.5

## Value

An object of class `catmull_rom` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

- `max_parameter()`: Get the maximum parameter value of the spline.

- `parameter_at_point(i)`: Get the parameter value at index `i`.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/catmull_rom.html)

## Examples

``` r
control_points <- list(c(0, 0, 0), c(1, 1, 0), c(2, 0, 0), c(3, 1, 0))
interpolator <- catmull_rom(control_points)
xi <- 1.5
interpolator$interpolate(xi)
#> [1] 1.2613446 0.8307972 0.0000000
interpolator$prime(xi)
#> [1]  0.8408964 -1.1363078  0.0000000
interpolator$max_parameter()
#> [1] 3.567621
interpolator$parameter_at_point(2)
#> [1] 2.378414
```
