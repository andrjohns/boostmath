# Jacobi Theta Functions

Functions to compute the Jacobi theta functions \\(\theta_1, \theta_2,
\theta_3, \theta_4)\\ parameterised by either \\(q)\\ or \\(\tau)\\.

## Usage

``` r
jacobi_theta1(x, q)

jacobi_theta1tau(x, tau)

jacobi_theta2(x, q)

jacobi_theta2tau(x, tau)

jacobi_theta3(x, q)

jacobi_theta3tau(x, tau)

jacobi_theta3m1(x, q)

jacobi_theta3m1tau(x, tau)

jacobi_theta4(x, q)

jacobi_theta4tau(x, tau)

jacobi_theta4m1(x, q)

jacobi_theta4m1tau(x, tau)
```

## Arguments

- x:

  Input value

- q:

  The nome parameter of the Jacobi theta function (0 \< q \< 1)

- tau:

  The nome parameter of the Jacobi theta function (tau = u + iv, where u
  and v are real numbers)

## Value

A single numeric value with the computed Jacobi theta function.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/jacobi_theta.html)
for more details on the mathematical background.

## Examples

``` r
# Jacobi Theta Functions
x <- 0.5
q <- 0.9
tau <- 1.5
jacobi_theta1(x, q)
#> [1] 0.0001025529
jacobi_theta1tau(x, tau)
#> [1] 0.2951461
jacobi_theta2(x, q)
#> [1] 0.5090257
jacobi_theta2tau(x, tau)
#> [1] 0.5403556
jacobi_theta3(x, q)
#> [1] 0.5090257
jacobi_theta3tau(x, tau)
#> [1] 1.009707
jacobi_theta3m1(x, q)
#> [1] -0.4909743
jacobi_theta3m1tau(x, tau)
#> [1] 0.00970738
jacobi_theta4(x, q)
#> [1] 0.0001025529
jacobi_theta4tau(x, tau)
#> [1] 0.9902926
jacobi_theta4m1(x, q)
#> [1] -0.9998974
jacobi_theta4m1tau(x, tau)
#> [1] -0.009707391
```
