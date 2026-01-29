# Legendre Polynomials and Related Functions

Functions to compute Legendre polynomials of the first and second kind,
their derivatives, zeros, and related functions.

Legendre polynomials are orthogonal polynomials that are solutions to
Legendre's differential equation. They appear in physics (multipole
expansions, solutions to Laplace's equation in spherical coordinates)
and numerical analysis (Gaussian quadrature).

**Legendre Polynomials of the First Kind P_n(x):**

Standard solutions to the Legendre differential equation.

- Domain: -1 \<= x \<= 1 (domain error outside this range)

- Reflection formula: \\P\_{-l-1}(x) = P_l(x)\\

- `legendre_p(n, x)`: Evaluates P_n(x)

- `legendre_p_prime(n, x)`: Derivative of P_n(x)

- `legendre_p_zeros(n)`: Returns zeros in increasing order. For odd n,
  first zero is 0. Computed using Newton's method with Tricomi's initial
  estimates (O(n^2) complexity)

**Associated Legendre Polynomials P_n^m(x):**

- `legendre_p_m(n, m, x)`: Evaluates P_n^m(x)

- Includes Condon-Shortley phase term (-1)^m matching Abramowitz &
  Stegun definition

- Negative values of n and m handled through identity relations

**Legendre Polynomials of the Second Kind Q_n(x):**

Second solution to the Legendre differential equation.

- `legendre_q(n, x)`: Evaluates Q_n(x)

- Domain: -1 \<= x \<= 1 (domain error otherwise)

**Recurrence Relations:**

Efficient computation using three-term recurrence at fixed x with
increasing degree:

- `legendre_next(n, x, Pl, Plm1)`: Computes \\P\_{n+1}(x)\\ from \\P_n\\
  and \\P\_{n-1}\\

- `legendre_next_m(n, m, x, Pl, Plm1)`: Computes \\P\_{n+1}^m(x)\\ from
  previous values

Recurrence relations guarantee low absolute error but cannot guarantee
low relative error near polynomial roots.

## Usage

``` r
legendre_p(n, x)

legendre_p_prime(n, x)

legendre_p_zeros(n)

legendre_p_m(n, m, x)

legendre_q(n, x)

legendre_next(n, x, Pl, Plm1)

legendre_next_m(n, m, x, Pl, Plm1)
```

## Arguments

- n:

  Degree of the polynomial

- x:

  Argument of the polynomial (must be in \\\[-1, 1\]\\)

- m:

  Order of the polynomial (for associated Legendre polynomials)

- Pl:

  Value of the Legendre polynomial P_l(x)

- Plm1:

  Value of the Legendre polynomial \\P\_{l-1}(x)\\

## Value

A single numeric value with the computed Legendre polynomial, its
derivative, or zeros (as a vector).

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/legendre.html)
for more details on the mathematical background.

## Examples

``` r
# Legendre polynomial of the first kind P_2(0.5)
legendre_p(2, 0.5)
#> [1] -0.125
# Derivative of the Legendre polynomial of the first kind P_2'(0.5)
legendre_p_prime(2, 0.5)
#> [1] 1.5
# Zeros of the Legendre polynomial of the first kind P_2
legendre_p_zeros(2)
#> [1] 0.5773503
# Associated Legendre polynomial P_2^1(0.5)
legendre_p_m(2, 1, 0.5)
#> [1] -1.299038
# Legendre polynomial of the second kind Q_2(0.5)
legendre_q(2, 0.5)
#> [1] -0.8186633
# Next Legendre polynomial of the first kind P_3(0.5) using P_2(0.5) and P_1(0.5)
legendre_next(2, 0.5, legendre_p(2, 0.5), legendre_p(1, 0.5))
#> [1] -0.4375
# Next associated Legendre polynomial P_3^1(0.5) using P_2^1(0.5) and P_1^1(0.5)
legendre_next_m(2, 1, 0.5, legendre_p_m(2, 1, 0.5), legendre_p_m(1, 1, 0.5))
#> [1] -0.3247595
```
