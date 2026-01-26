# Bessel Functions, Their Derivatives, and Zeros

Functions to compute Bessel functions of the first and second kind,
their modified versions, spherical Bessel functions, and their
derivatives and zeros.

Bessel functions are solutions to Bessel's ordinary differential
equation and appear in many problems with cylindrical or spherical
symmetry, such as wave propagation, heat conduction, and quantum
mechanics.

**Bessel Functions of the First and Second Kinds**

- `cyl_bessel_j(v, x)`: Computes the Bessel function of the first kind
  \\J_v(x)\\:

\$\$J_v(x) =
\left(\frac{1}{2}x\right)^v\sum\_{k=0}^\infty{\frac{\left(-\frac{1}{4}x^2\right)^k}{k!\Gamma(v+k+1)}}\$\$

- `cyl_neumann(v, x)`: Computes the Bessel function of the second kind
  \\Y_v(x) = N_V(x)\\:

\$\$Y_v(x) = \frac{J_v(x)\cos(v\pi) - J\_{-v}(x)}{\sin(v\pi)}\$\$

**Modified Bessel Functions of the First and Second Kinds**

- `cyl_bessel_i(v, x)`: Computes the modified Bessel function of the
  first kind \\I_v(x)\\:

\$\$I_v(x) =
\left(\frac{1}{2}x\right)^v\sum\_{k=0}^\infty{\frac{\left(\frac{1}{4}x^2\right)^k}{k!\Gamma(v+k+1)}}\$\$

- `cyl_bessel_k(v, x)`: Computes the modified Bessel function of the
  second kind \\K_v(x)\\:

\$\$K_v(x) = \frac{\pi}{2} \frac{I\_{-v}(x) - I\_{v}(x)}{\sin(v\pi)}\$\$

**Spherical Bessel Functions of the First and Second Kinds**

- `sph_bessel(v, x)`: Computes the Spherical Bessel function of the
  first kind \\j_v(x)\\:

\$\$j_v(x) = \sqrt{\frac{\pi}{2x}}J\_{v+\frac{1}{2}}(x)\$\$

- `sph_neumann(v, x)`: Computes the Spherical Bessel function of the
  second kind \\y_v(x) = n_v(x)\\:

\$\$y_v(x) = \sqrt{\frac{\pi}{2x}}Y\_{v+\frac{1}{2}}(x)\$\$

**Derivatives:**

The \_prime functions compute the derivatives with respect to x of the
corresponding Bessel functions:

\$\$J'\_v(x) = \frac{J\_{v-1}(x)-J\_{v+1}(x)}{2}\$\$ \$\$Y'\_v(x) =
\frac{Y\_{v-1}(x)-Y\_{v+1}(x)}{2}\$\$ \$\$I'\_v(x) =
\frac{I\_{v-1}(x)-I\_{v+1}(x)}{2}\$\$ \$\$K'\_v(x) =
\frac{K\_{v-1}(x)-K\_{v+1}(x)}{-2}\$\$ \$\$j'\_v(x) =
\left(\frac{v}{x}\right)j_v(x)-j\_{v+1}(x)\$\$ \$\$y'\_v(x) =
\left(\frac{v}{x}\right)y_v(x)-y\_{v+1}(x)\$\$

**Zeros:**

The zero functions find the zeros of J_v and Y_v (where the function
equals zero), indexed starting from 1.

## Usage

``` r
cyl_bessel_j(v, x)

cyl_neumann(v, x)

cyl_bessel_j_zero(v, m = NULL, start_index = NULL, number_of_zeros = NULL)

cyl_neumann_zero(v, m = NULL, start_index = NULL, number_of_zeros = NULL)

cyl_bessel_i(v, x)

cyl_bessel_k(v, x)

sph_bessel(v, x)

sph_neumann(v, x)

cyl_bessel_j_prime(v, x)

cyl_neumann_prime(v, x)

cyl_bessel_i_prime(v, x)

cyl_bessel_k_prime(v, x)

sph_bessel_prime(v, x)

sph_neumann_prime(v, x)
```

## Arguments

- v:

  Order of the Bessel function (can be any real number)

- x:

  Argument of the Bessel function

- m:

  The index of the zero to find (1-based).

- start_index:

  The starting index for the zeros (1-based).

- number_of_zeros:

  The number of zeros to find.

## Value

Single numeric value for the Bessel functions and their derivatives, or
a vector of length `number_of_zeros` for the multiple zero functions.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bessel.html)
for more details on the mathematical background.

## Examples

``` r
# Bessel function of the first kind J_0(1)
cyl_bessel_j(0, 1)
#> [1] 0.7651977
# Bessel function of the second kind Y_0(1)
cyl_neumann(0, 1)
#> [1] 0.08825696
# Modified Bessel function of the first kind I_0(1)
cyl_bessel_i(0, 1)
#> [1] 1.266066
# Modified Bessel function of the second kind K_0(1)
cyl_bessel_k(0, 1)
#> [1] 0.4210244
# Spherical Bessel function of the first kind j_0(1)
sph_bessel(0, 1)
#> [1] 0.841471
# Spherical Bessel function of the second kind y_0(1)
sph_neumann(0, 1)
#> [1] -0.5403023
# Derivative of the Bessel function of the first kind J_0(1)
cyl_bessel_j_prime(0, 1)
#> [1] -0.4400506
# Derivative of the Bessel function of the second kind Y_0(1)
cyl_neumann_prime(0, 1)
#> [1] 0.7812128
# Derivative of the modified Bessel function of the first kind I_0(1)
cyl_bessel_i_prime(0, 1)
#> [1] 0.5651591
# Derivative of the modified Bessel function of the second kind K_0(1)
cyl_bessel_k_prime(0, 1)
#> [1] -0.6019072
# Derivative of the spherical Bessel function of the first kind j_0(1)
sph_bessel_prime(0, 1)
#> [1] -0.3011687
# Derivative of the spherical Bessel function of the second kind y_0(1)
sph_neumann_prime(0, 1)
#> [1] 1.381773
# Finding the first zero of the Bessel function of the first kind J_0
cyl_bessel_j_zero(0, 1)
#> [1] 2.404826
# Finding the first zero of the Bessel function of the second kind Y_0
cyl_neumann_zero(0, 1)
#> [1] 0.893577
# Finding multiple zeros of the Bessel function of the first kind J_0 starting from index 1
cyl_bessel_j_zero(0, start_index = 1, number_of_zeros = 5)
#> [1]  2.404826  5.520078  8.653728 11.791534 14.930918
# Finding multiple zeros of the Bessel function of the second kind Y_0 starting from index 1
cyl_neumann_zero(0, start_index = 1, number_of_zeros = 5)
#> [1]  0.893577  3.957678  7.086051 10.222345 13.361097
```
