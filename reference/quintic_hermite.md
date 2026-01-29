# Quintic Hermite Interpolator

The quintic Hermite interpolator takes a list of possibly non-uniformly
spaced abscissas, ordinates, and their velocities and accelerations.

**Applications:**

It constructs a quintic interpolating polynomial between segments. This
is useful for taking solution skeletons from ODE steppers and turning
them into a continuous function. The interpolant is C2 and its
evaluation has O(log N) complexity.

## Usage

``` r
quintic_hermite(x, y, dydx, d2ydx2)
```

## Arguments

- x:

  Numeric vector of abscissas (x-coordinates).

- y:

  Numeric vector of ordinates (y-coordinates).

- dydx:

  Numeric vector of first derivatives (slopes) at each point.

- d2ydx2:

  Numeric vector of second derivatives at each point.

## Value

An object of class `quintic_hermite` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

- `double_prime(xi)`: Evaluate the second derivative of the interpolator
  at point `xi`.

- `push_back(x, y, dydx, d2ydx2)`: Add a new control point to the
  interpolator.

- `domain()`: Get the domain of the interpolator.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/quintic_hermite.html)

## Examples

``` r
x <- c(0, 1, 2)
y <- c(0, 1, 0)
dydx <- c(1, 0, -1)
d2ydx2 <- c(0, -1, 0)
interpolator <- quintic_hermite(x, y, dydx, d2ydx2)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.640625
interpolator$prime(xi)
#> [1] 1.40625
interpolator$double_prime(xi)
#> [1] -1.25
interpolator$push_back(3, 0, 1, 0)
#> NULL
interpolator$domain()
#> [1] 0 3
```
