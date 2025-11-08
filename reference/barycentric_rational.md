# Barycentric Rational Interpolation

Constructs a barycentric rational interpolator given data points.

## Usage

``` r
barycentric_rational(x, y, order = 3)
```

## Arguments

- x:

  Numeric vector of data points (abscissas).

- y:

  Numeric vector of data values (ordinates).

- order:

  Integer representing the approximation order of the interpolator,
  defaults to 3.

## Value

An object of class `barycentric_rational_interpolator` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

## Examples

``` r
x <- c(0, 1, 2, 3)
y <- c(1, 2, 0, 2)
order <- 3
interpolator <- barycentric_rational(x, y, order)
xi <- 1.5
interpolator$interpolate(xi)
#> [1] 0.9375
interpolator$prime(xi)
#> [1] -2.291667
```
