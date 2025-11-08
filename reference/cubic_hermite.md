# Cubic Hermite Interpolator

Constructs a cubic Hermite interpolator given the vectors of abscissas,
ordinates, and derivatives.

## Usage

``` r
cubic_hermite(x, y, dydx)
```

## Arguments

- x:

  Numeric vector of abscissas (x-coordinates).

- y:

  Numeric vector of ordinates (y-coordinates).

- dydx:

  Numeric vector of derivatives (slopes) at each point.

## Value

An object of class `cubic_hermite` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

- `push_back(x, y, dydx)`: Add a new control point to the interpolator.

- `domain()`: Get the domain of the interpolator.

## Examples

``` r
x <- c(0, 1, 2)
y <- c(0, 1, 0)
dydx <- c(1, 0, -1)
interpolator <- cubic_hermite(x, y, dydx)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.625
interpolator$prime(xi)
#> [1] 1.25
interpolator$push_back(3, 0, 1)
interpolator$domain()
#> [1] 0 3
```
