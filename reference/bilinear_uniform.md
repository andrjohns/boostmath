# Bilinear Uniform Interpolator

Constructs a bilinear uniform interpolator given a grid of data points.

## Usage

``` r
bilinear_uniform(x, rows, cols, dx = 1, dy = 1, x0 = 0, y0 = 0)
```

## Arguments

- x:

  Numeric vector of all grid elements

- rows:

  Integer representing the number of rows in the grid

- cols:

  Integer representing the number of columns in the grid

- dx:

  Numeric value representing the spacing between grid points in the
  x-direction, defaults to 1

- dy:

  Numeric value representing the spacing between grid points in the
  y-direction, defaults to 1

- x0:

  Numeric value representing the x-coordinate of the origin, defaults to
  0

- y0:

  Numeric value representing the y-coordinate of the origin, defaults to
  0

## Value

An object of class `bilinear_uniform` with methods:

- `interpolate(xi, yi)`: Evaluate the interpolator at point `(xi, yi)`.

## Examples

``` r
x <- seq(0, 1, length.out = 10)
interpolator <- bilinear_uniform(x, rows = 2, cols = 5)
xi <- 0.5
yi <- 0.5
interpolator$interpolate(xi, yi)
#> [1] 0.3333333
```
