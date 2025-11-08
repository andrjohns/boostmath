# Boost Math - Interpolation

## Interpolation

The
[Interpolation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/interpolation.html)
section of the Boost Math library provides methods for numerical
integration and differentiation of functions. These methods can be used
directly in R without needing any additional compilation.

### [Cardinal Cubic B-Spline](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cardinal_cubic_b.html)

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

### [Barycentric Rational Interpolation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/barycentric.html)

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

### [Bezier Polynomial](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bezier_polynomial.html)

``` r
control_points <- list(c(0, 0, 0), c(1, 2, 0), c(2, 0, 0), c(3, 3, 0))
interpolator <- bezier_polynomial(control_points)
xi <- 0.8
interpolator$interpolate(xi)
#> [1] 2.400 1.728 0.000
interpolator$prime(xi)
#> [1] 3.00 4.08 0.00
new_control_point <- c(1.5, 1, 0)
interpolator$edit_control_point(new_control_point, 2)
```

### [Bilinear Uniform](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bilinear_uniform.html)

``` r
x <- seq(0, 1, length.out = 10)
interpolator <- bilinear_uniform(x, rows = 2, cols = 5)
xi <- 0.5
yi <- 0.5
interpolator$interpolate(xi, yi)
#> [1] 0.3333333
```

### [Cardinal Quadratic B-Spline](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cardinal_quadratic_b.html)

``` r
y <- c(0, 1, 0, 1)
t0 <- 0
h <- 1
interpolator <- cardinal_quadratic_b_spline(y, t0, h)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.7857143
interpolator$prime(xi)
#> [1] 1.142857
```

### [Cardinal Quintic B-Spline](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cardinal_quintic_b.html)

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

### [Catmull-Rom](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/catmull_rom.html)

``` r
control_points <- list(c(0, 0, 0), c(1, 1, 0), c(2, 0, 0), c(3, 1, 0))
interpolator <- catmull_rom(control_points)
xi <- 1.5
interpolator$interpolate(xi)
#> [1] 1.2613446 0.8307972 0.0000000
interpolator$prime(xi)
#> [1]  0.8408964 -1.1363078  0.0000000
interpolator$max_parameter()
#> [1] 3.567621
interpolator$parameter_at_point(2)
#> [1] 2.378414
```

### [Cubic Hermite](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cubic_hermite.html)

``` r
x <- c(0, 1, 2)
y <- c(0, 1, 0)
dydx <- c(1, 0, -1)
interpolator <- cubic_hermite(x, y, dydx)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.625
interpolator$prime(xi)
#> [1] 1.25
interpolator$domain()
#> [1] 0 2

# Add a new point
interpolator$push_back(3, 0, 1)
interpolator$interpolate(xi)
#> [1] 0.625
interpolator$prime(xi)
#> [1] 1.25
interpolator$domain()
#> [1] 0 3
```

### [Cardinal Cubic Hermite](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cubic_hermite.html)

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

### [Modified Akima](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/makima.html)

``` r
x <- c(0, 1, 2, 3)
y <- c(0, 1, 0, 1)
interpolator <- makima(x, y)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.7291667
interpolator$prime(xi)
#> [1] 1.208333

# Add a new point
interpolator$push_back(4, 1)
interpolator$interpolate(xi)
#> [1] 0.7291667
interpolator$prime(xi)
#> [1] 1.208333
```

### [PCHIP](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/pchip.html)

``` r
x <- c(0, 1, 2, 3)
y <- c(0, 1, 0, 1)
interpolator <- pchip(x, y)
xi <- 0.5
interpolator$interpolate(xi)
#> [1] 0.625
interpolator$prime(xi)
#> [1] 1.25

# Add a new point
interpolator$push_back(4, 1)
interpolator$interpolate(xi)
#> [1] 0.625
interpolator$prime(xi)
#> [1] 1.25
```

### [Quintic Hermite](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/quintic_hermite.html)

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
interpolator$domain()
#> [1] 0 2

# Add a new point
interpolator$push_back(3, 0, 1, 0)
#> NULL
interpolator$interpolate(xi)
#> [1] 0.640625
interpolator$prime(xi)
#> [1] 1.40625
interpolator$double_prime(xi)
#> [1] -1.25
interpolator$domain()
#> [1] 0 3
```
