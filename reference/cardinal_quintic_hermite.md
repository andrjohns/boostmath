# Cardinal Quintic Hermite Interpolator

The cardinal quintic Hermite interpolator is similar to the quintic
Hermite interpolator but optimised for equispaced data.

**Performance:**

This allows for constant-time evaluation.

## Usage

``` r
cardinal_quintic_hermite(y, dydx, d2ydx2, x0, dx)
```

## Arguments

- y:

  Numeric vector of ordinates (y-coordinates).

- dydx:

  Numeric vector of first derivatives (slopes) at each point.

- d2ydx2:

  Numeric vector of second derivatives at each point.

- x0:

  Numeric value of the first abscissa (x-coordinate).

- dx:

  Numeric value of the spacing between abscissas.

## Value

An object of class `cardinal_quintic_hermite` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

- `double_prime(xi)`: Evaluate the second derivative of the interpolator
  at point `xi`.

- `domain()`: Get the domain of the interpolator.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/quintic_hermite.html)

## Examples

``` r
y <- c(0, 1, 0)
dydx <- c(1, 0, -1)
d2ydx2 <- c(0, -1, 0)
x0 <- 0
dx <- 1
interpolator <- cardinal_quintic_hermite(y, dydx, d2ydx2, x0, dx)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.640625
interpolator$prime(xi)
#> [1] 1.40625
interpolator$double_prime(xi)
#> [1] -1.25
interpolator$domain()
#> [1] 0 2
```
