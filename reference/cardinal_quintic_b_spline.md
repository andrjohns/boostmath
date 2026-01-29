# Cardinal Quintic B-Spline Interpolator

The cardinal quintic B-spline interpolator is similar to the cubic
B-spline but uses basis functions constructed by convolving a box
function with itself five times.

**Properties:**

The basis functions are more smooth (C4) than the cubic B-spline (C2),
making this useful for computing second derivatives. The second
derivative of the quintic B-spline is a cubic spline.

## Usage

``` r
cardinal_quintic_b_spline(
  y,
  t0,
  h,
  left_endpoint_derivatives = NULL,
  right_endpoint_derivatives = NULL
)
```

## Arguments

- y:

  Numeric vector of data points to interpolate.

- t0:

  Numeric scalar representing the starting point of the data.

- h:

  Numeric scalar representing the spacing between data points.

- left_endpoint_derivatives:

  Optional two-element numeric vector for the derivative at the left
  endpoint.

- right_endpoint_derivatives:

  Optional two-element numeric vector for the derivative at the right
  endpoint.

## Value

An object of class `cardinal_quintic_b_spline` with methods:

- `interpolate(xi)`: Evaluate the interpolator at point `xi`.

- `prime(xi)`: Evaluate the derivative of the interpolator at point
  `xi`.

- `double_prime(xi)`: Evaluate the second derivative of the interpolator
  at point `xi`.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cardinal_quintic_b.html)

## Examples

``` r
y <- seq(0, 1, length.out = 20)
t0 <- 0
h <- 1
interpolator <- cardinal_quintic_b_spline(y, t0, h)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.02631579
interpolator$prime(xi)
#> [1] 0.05263158
interpolator$double_prime(xi)
#> [1] 8.84709e-17
```
