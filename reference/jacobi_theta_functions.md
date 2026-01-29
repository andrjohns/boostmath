# Jacobi Theta Functions

Functions to compute the four Jacobi theta functions theta_1, theta_2,
theta_3, theta_4, which are inter-related periodic functions
parameterised by either q (nome) or tau.

Jacobi theta functions are fundamental in the theory of elliptic
functions, modular forms, and appear in number theory, string theory,
and solutions to the heat equation on a circle.

**The Four Theta Functions:**

- **theta_1(x, q)** - First Jacobi theta function

- **theta_2(x, q)** - Second Jacobi theta function

- **theta_3(x, q)** - Third Jacobi theta function

- **theta_4(x, q)** - Fourth Jacobi theta function

These are periodic functions of x expressed in terms of the nome
parameter q.

**Parametrizations:**

- **q-parameterization:** Functions with q parameter where 0 \< q \< 1.
  These are equivalent to Mathematica's EllipticTheta function (whose
  first argument is the function number).

  - `jacobi_theta1(x, q)`, `jacobi_theta2(x, q)`, `jacobi_theta3(x, q)`,
    `jacobi_theta4(x, q)`

- **tau-parameterization:** Alternative form where q is expressed
  through tau. The mathematical tau is assumed to be purely imaginary,
  but the Boost argument is real-valued and implicitly multiplied by i.

  - `jacobi_theta1tau(x, tau)`, `jacobi_theta2tau(x, tau)`, etc.

**Special "Minus 1" Variants:**

Similar to expm1(), these functions return one less than the evaluated
function, yielding increased accuracy when q is small:

- `jacobi_theta3m1(x, q)` = theta_3(x, q) - 1

- `jacobi_theta4m1(x, q)` = theta_4(x, q) - 1

- Also available in tau-parameterization: `jacobi_theta3m1tau`,
  `jacobi_theta4m1tau`

**Relationships:**

The four theta functions are closely related through addition formulas
and transformations. They satisfy various identities and can be
expressed in terms of infinite series or products.

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

  Input value (argument of the theta function)

- q:

  The nome parameter of the Jacobi theta function (0 \< q \< 1)

- tau:

  The nome parameter in tau-form (real-valued, implicitly multiplied by
  i)

## Value

A single numeric value with the computed Jacobi theta function.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/jacobi_theta.html)
for more details on the mathematical background.

## Examples

``` r
# Jacobi Theta Functions with q parametrization
x <- 0.5
q <- 0.3  # Note: q should be in (0, 1)
tau <- 1.5
jacobi_theta1(x, q)
#> [1] 0.577394
jacobi_theta1tau(x, tau)
#> [1] 0.2951461
jacobi_theta2(x, q)
#> [1] 1.307526
jacobi_theta2tau(x, tau)
#> [1] 0.5403556
jacobi_theta3(x, q)
#> [1] 1.317401
jacobi_theta3tau(x, tau)
#> [1] 1.009707
# Special "minus 1" variants for improved accuracy when q is small
jacobi_theta3m1(x, q)
#> [1] 0.3174008
jacobi_theta3m1tau(x, tau)
#> [1] 0.00970738
jacobi_theta4(x, q)
#> [1] 0.669116
jacobi_theta4tau(x, tau)
#> [1] 0.9902926
jacobi_theta4m1(x, q)
#> [1] -0.330884
jacobi_theta4m1tau(x, tau)
#> [1] -0.009707391
```
