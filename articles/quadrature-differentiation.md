# Boost Math - Quadrature and Differentiation

## Quadrature and Differentiation

The [Quadrature and
Differentiation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/quadrature.html)
section of the Boost Math library provides methods for numerical
integration and differentiation of functions. These methods can be used
directly in R without needing any additional compilation.

### [Trapezoidal Quadrature](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/trapezoidal.html)

``` r
# Trapezoidal rule integration of sin(x) from 0 to pi
trapezoidal(sin, 0, pi)
#> [1] 2
```

### [Gauss-Legendre Quadrature](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/gauss.html)

``` r
# Gauss-Legendre integration of exp(x) from 0 to 1
gauss_legendre(exp, 0, 1, points = 7)
#> [1] 1.718282
```

### [Gauss-Kronrod Quadrature](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/gauss_kronrod.html)

``` r
# Adaptive Gauss-Kronrod integration of log(x) from 1 to 2
gauss_kronrod(log, 1, 2, points = 15, max_depth = 10)
#> [1] 0.3862944

# Non-adaptive Gauss-Kronrod integration of log(x) from 1 to 2
gauss_kronrod(log, 1, 2, points = 15, max_depth = 0)
#> [1] 0.3862944
```

### [Double-Exponential Quadrature](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/double_exponential.html)

``` r
# Tanh-sinh quadrature of log(x) from 0 to 1
tanh_sinh(function(x) { log(x) * log1p(-x) }, a = 0, b = 1)
#> [1] 0.3550659
# Sinh-sinh quadrature of exp(-x^2)
sinh_sinh(function(x) { exp(-x * x) })
#> [1] 1.772454
# Exp-sinh quadrature of exp(-3*x) from 0 to Inf
exp_sinh(function(x) { exp(-3 * x) }, a = 0, b = Inf)
#> [1] 0.3333333
```

### [Fourier Integrals](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/fourier_integrals.html)

``` r
# Fourier sine integral of sin(x) with omega = 1
# ooura_fourier_sin(function(x) { 1 / x }, omega = 1)
# Fourier cosine integral of cos(x) with omega = 1
# ooura_fourier_cos(function(x) { 1/ (x * x + 1) }, omega = 1)
```

### [Numerical Differentiation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/diff.html)

``` r
# Finite difference derivative of sin(x) at pi/4
finite_difference_derivative(sin, pi / 4)
#> [1] 0.7071068
# Complex step derivative of exp(x) at 1.7
complex_step_derivative(exp, 1.7)
#> [1] 5.473947
```
