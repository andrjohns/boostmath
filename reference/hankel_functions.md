# Hankel Functions

Functions to compute cyclic and spherical Hankel functions of the first
and second kinds.

## Usage

``` r
cyl_hankel_1(v, x)

cyl_hankel_2(v, x)

sph_hankel_1(v, x)

sph_hankel_2(v, x)
```

## Arguments

- v:

  Order of the Hankel function

- x:

  Argument of the Hankel function

## Value

A single complex value with the computed Hankel function.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/hankel.html)
for more details on the mathematical background.

## Examples

``` r
cyl_hankel_1(2, 0.5)
#> [1] 0.03060402-5.441371i
cyl_hankel_2(2, 0.5)
#> [1] 0.03060402+5.441371i
sph_hankel_1(2, 0.5)
#> [1] 0.01637111-25.05992i
sph_hankel_2(2, 0.5)
#> [1] 0.01637111+25.05992i
```
