# Elliptic Integrals

Functions to compute various elliptic integrals, including Carlson's
elliptic integrals and incomplete elliptic integrals.

## Usage

``` r
ellint_rf(x, y, z)

ellint_rd(x, y, z)

ellint_rj(x, y, z, p)

ellint_rc(x, y)

ellint_rg(x, y, z)

ellint_1(k, phi = NULL)

ellint_2(k, phi = NULL)

ellint_3(k, n, phi = NULL)

ellint_d(k, phi = NULL)

jacobi_zeta(k, phi)

heuman_lambda(k, phi)
```

## Arguments

- x:

  First parameter of the integral

- y:

  Second parameter of the integral

- z:

  Third parameter of the integral

- p:

  Fourth parameter of the integral (for Rj)

- k:

  Elliptic modulus (for incomplete elliptic integrals)

- phi:

  Amplitude (for incomplete elliptic integrals)

- n:

  Characteristic (for incomplete elliptic integrals of the third kind)

## Value

A single numeric value with the computed elliptic integral.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/ellint.html)
for more details on the mathematical background.

## Examples

``` r
# Carlson's elliptic integral Rf with parameters x = 1, y = 2, z = 3
ellint_rf(1, 2, 3)
#> [1] 0.7269459
#' # Carlson's elliptic integral Rd with parameters x = 1, y = 2, z = 3
ellint_rd(1, 2, 3)
#> [1] 0.2904603
# Carlson's elliptic integral Rj with parameters x = 1, y = 2, z = 3, p = 4
ellint_rj(1, 2, 3, 4)
#> [1] 0.2398481
# Carlson's elliptic integral Rc with parameters x = 1, y = 2
ellint_rc(1, 2)
#> [1] 0.7853982
# Carlson's elliptic integral Rg with parameters x = 1, y = 2, z = 3
ellint_rg(1, 2, 3)
#> [1] 1.401847
# Incomplete elliptic integral of the first kind with k = 0.5, phi = pi/4
ellint_1(0.5, pi / 4)
#> [1] 0.8043661
# Complete elliptic integral of the first kind
ellint_1(0.5)
#> [1] 1.68575
# Incomplete elliptic integral of the second kind with k = 0.5, phi = pi/4
ellint_2(0.5, pi / 4)
#> [1] 0.767196
# Complete elliptic integral of the second kind
ellint_2(0.5)
#> [1] 1.467462
# Incomplete elliptic integral of the third kind with k = 0.5, n = 0.5, phi = pi/4
ellint_3(0.5, 0.5, pi / 4)
#> [1] 0.8930657
# Complete elliptic integral of the third kind with k = 0.5, n = 0.5
ellint_3(0.5, 0.5)
#> [1] 2.413672
# Incomplete elliptic integral D with k = 0.5, phi = pi/4
ellint_d(0.5, pi / 4)
#> [1] 0.1486805
# Complete elliptic integral D
ellint_d(0.5)
#> [1] 0.8731526
# Jacobi zeta function with k = 0.5, phi = pi/4
jacobi_zeta(0.5, pi / 4)
#> [1] 0.06698741
# Heuman's lambda function with k = 0.5, phi = pi/4
heuman_lambda(0.5, pi / 4)
#> [1] 0.6632254
```
