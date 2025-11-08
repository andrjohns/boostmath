# Cardinal Cubic Hermite Interpolator

Constructs a cardinal cubic Hermite interpolator given the vectors of
abscissas, ordinates, and derivatives.

## Usage

``` r
cardinal_cubic_hermite(y, dydx, x0, dx)
```

## Arguments

- y:

  Numeric vector of ordinates (y-coordinates).

- dydx:

  Numeric vector of derivatives (slopes) at each point.

- x0:

  Numeric value of the first abscissa (x-coordinate).

- dx:

  Numeric value of the spacing between abscissas.

## Value

An object of class `cardinal_cubic_hermite` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

- `domain()`: Get the domain of the interpolator.

## Examples

``` r
y <- c(0, 1, 0)
dydx <- c(1, 0, -1)
interpolator <- cardinal_cubic_hermite(y, dydx, 0, 1)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.625
interpolator$prime(xi)
#> [1] 1.25
interpolator$domain()
#> [1] 0 2
```
