# PCHIP Interpolator

Constructs a PCHIP interpolator given the vectors of abscissas,
ordinates, and derivatives.

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
