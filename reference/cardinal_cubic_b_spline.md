# Cardinal Cubic B-Spline Interpolator

Constructs a cardinal cubic B-spline interpolator given data points.

## Usage

``` r
cardinal_cubic_b_spline(
  y,
  t0,
  h,
  left_endpoint_derivative = NULL,
  right_endpoint_derivative = NULL
)
```

## Arguments

- y:

  Numeric vector of data points to interpolate.

- t0:

  Numeric scalar representing the starting point of the data.

- h:

  Numeric scalar representing the spacing between data points.

- left_endpoint_derivative:

  Optional numeric scalar for the derivative at the left endpoint.

- right_endpoint_derivative:

  Optional numeric scalar for the derivative at the right endpoint.

## Value

An object of class `cardinal_cubic_b_spline` with methods:

- `interpolate(x)`: Evaluate the spline at point `x`.

- `prime(x)`: Evaluate the first derivative of the spline at point `x`.

- `double_prime(x)`: Evaluate the second derivative of the spline at
  point `x`.

## Examples

``` r
y <- c(1, 2, 0, 2, 1)
t0 <- 0
h <- 1
spline_obj <- cardinal_cubic_b_spline(y, t0, h)
x <- 0.5
spline_obj$interpolate(x)
#> [1] 2.895833
spline_obj$prime(x)
#> [1] 0.125
spline_obj$double_prime(x)
#> [1] -11.16667
```
