# Modified Akima Interpolator

The modified Akima interpolant takes non-equispaced data and
interpolates between them via cubic Hermite polynomials whose slopes are
chosen significantly.

**Properties:**

The slopes are chosen by a modification of a geometric construction
proposed by Akima. The interpolant is C1 and evaluation has O(log N)
complexity. It oscillates less than the cubic spline but has less
smoothness. The modification is given by Cosmin Ionita and agrees with
Matlab's version.

## Usage

``` r
makima(x, y, left_endpoint_derivative = NULL, right_endpoint_derivative = NULL)
```

## Arguments

- x:

  Numeric vector of abscissas (x-coordinates).

- y:

  Numeric vector of ordinates (y-coordinates).

- left_endpoint_derivative:

  Optional numeric value of the derivative at the left endpoint.

- right_endpoint_derivative:

  Optional numeric value of the derivative at the right endpoint.

## Value

An object of class `makima` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

- `push_back(x, y)`: Add a new control point

## Examples

``` r
x <- c(0, 1, 2, 3)
y <- c(0, 1, 0, 1)
interpolator <- makima(x, y)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.7291667
interpolator$prime(xi)
#> [1] 1.208333
interpolator$push_back(4, 1)
```
