# PCHIP Interpolator

The PCHIP (Piecewise Cubic Hermite Interpolating Polynomial) interpolant
takes non-equispaced data and interpolates between them via cubic
Hermite polynomials whose slopes are chosen to preserve monotonicity.

**Details:**

The interpolant is C1 and evaluation has O(log N) complexity. See
Fritsch and Carlson for details.

## Usage

``` r
pchip(x, y, left_endpoint_derivative = NULL, right_endpoint_derivative = NULL)
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

An object of class `pchip` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

- `push_back(x, y)`: Add a new control point

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/pchip.html)

## Examples

``` r
x <- c(0, 1, 2, 3)
y <- c(0, 1, 0, 1)
interpolator <- pchip(x, y)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.625
interpolator$prime(xi)
#> [1] 1.25
interpolator$push_back(4, 1)
```
