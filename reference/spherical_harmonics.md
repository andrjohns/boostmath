# Spherical Harmonics

Functions to compute spherical harmonics and related functions.

## Usage

``` r
spherical_harmonic(n, m, theta, phi)

spherical_harmonic_r(n, m, theta, phi)

spherical_harmonic_i(n, m, theta, phi)
```

## Arguments

- n:

  Degree of the spherical harmonic

- m:

  Order of the spherical harmonic

- theta:

  Polar angle (colatitude)

- phi:

  Azimuthal angle (longitude)

## Value

A single complex value with the computed spherical harmonic function, or
its real and imaginary parts.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/sph_harm.html)

## Examples

``` r
# Spherical harmonic function Y_2^1(0.5, 0.5)
spherical_harmonic(2, 1, 0.5, 0.5)
#> [1] -0.2852481-0.1558318i
# Real part of the spherical harmonic function Y_2^1(0.5, 0.5)
spherical_harmonic_r(2, 1, 0.5, 0.5)
#> [1] -0.2852481
# Imaginary part of the spherical harmonic function Y_2^1(0.5, 0.5)
spherical_harmonic_i(2, 1, 0.5, 0.5)
#> [1] -0.1558318
```
