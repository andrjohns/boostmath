# Bezier Polynomial Interpolator

Constructs a Bezier polynomial interpolator given control points.

## Usage

``` r
bezier_polynomial(control_points)
```

## Arguments

- control_points:

  List of control points, where each element is a numeric vector of
  length 3.

## Value

An object of class `bezier_polynomial` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

- `edit_control_point(new_control_point, index)`: Insert a new control
  point at the specified index.

## Examples

``` r
control_points <- list(c(0, 0, 0), c(1, 2, 0), c(2, 0, 0), c(3, 3, 0))
interpolator <- bezier_polynomial(control_points)
xi <- 1.5
interpolator$interpolate(xi)
#> [1] NaN NaN NaN
interpolator$prime(xi)
#> [1]  3.00 30.75  0.00
new_control_point <- c(1.5, 1, 0)
interpolator$edit_control_point(new_control_point, 2)
```
