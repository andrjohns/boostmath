# Jacobi Theta Functions

Functions to compute the four Jacobi theta functions theta_1, theta_2,
theta_3, theta_4, which are inter-related periodic functions
parameterised by either q (nome) or tau.

**Jacobi Theta Function \\\theta_1\\**

- `jacobi_theta1(x, q)`: First Jacobi theta function, nome
  parameterisation:

\$\$\theta_1(x, q) = 2\sum\_{n=0}^\infty(-1)^n q^{(n +
\frac{1}{2})^2}\text{sin}((2n+1)x)\$\$

- `jacobi_theta1tau(x, tau)`: First Jacobi theta function, tau
  parameterisation:

\$\$\theta_1(x \| \tau) = 2\sum\_{n=0}^\infty(-1)^n
\exp(i\pi\tau(n+0.5)^2) \text{sin}((2n+1)x)\$\$

**Jacobi Theta Function \\\theta_2\\**

- `jacobi_theta2(x, q)`: Second Jacobi theta function, nome
  parameterisation:

\$\$\theta_2(x, q) = 2\sum\_{n=0}^\infty q^{(n + \frac{1}{2})^2}
\text{cos}((2n+1)x)\$\$

- `jacobi_theta2tau(x, tau)`: Second Jacobi theta function, tau
  parameterisation:

\$\$\theta_2(x \| \tau) = 2\sum\_{n=0}^\infty \exp(i\pi\tau(n+0.5)^2)
\text{cos}((2n+1)x)\$\$

**Jacobi Theta Function \\\theta_3\\**

- `jacobi_theta3(x, q)`: Third Jacobi theta function, nome
  parameterisation:

\$\$\theta_3(x, q) = 1 + 2\sum\_{n=0}^\infty q^{n^2}
\text{cos}((2nx)\$\$

- `jacobi_theta3tau(x, tau)`: Third Jacobi theta function, tau
  parameterisation:

\$\$\theta_3(x \| \tau) = 1 + 2\sum\_{n=0}^\infty \exp(i\pi\tau n^2)
\text{cos}(2nx)\$\$

**Jacobi Theta Function \\\theta_4\\**

- `jacobi_theta4(x, q)`: Fourth Jacobi theta function, nome
  parameterisation:

\$\$\theta_4(x, q) = 1 + 2\sum\_{n=0}^\infty (-1)^n q^{n^2}
\text{cos}((2nx)\$\$

- `jacobi_theta4tau(x, tau)`: Fourth Jacobi theta function, tau
  parameterisation:

\$\$\theta_4(x \| \tau) = 1 + 2\sum\_{n=0}^\infty (-1)^n \exp(i\pi\tau
n^2) \text{cos}(2nx)\$\$

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
