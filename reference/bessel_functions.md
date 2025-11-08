# Bessel Functions, Their Derivatives, and Zeros

Functions to compute Bessel functions of the first and second kind,
their modified versions, spherical Bessel functions, and their
derivatives and zeros.

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

  Order of the Bessel function

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
