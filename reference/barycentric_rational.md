# Barycentric Rational Interpolation

Barycentric rational interpolation is a high-accuracy interpolation
method for non-uniformly spaced samples.

**Performance and Accuracy:**

It requires O(N) time for construction and O(N) time for each
evaluation. If the approximation order is d, the error is O(h^(d+1)).

**Caveats:**

This method is robust but can behave unexpectedly if the sample spacing
at the endpoints is much larger than in the center.

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

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/barycentric.html)

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
