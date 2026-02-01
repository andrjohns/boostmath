# Hankel Functions

Functions to compute cylindrical and spherical Hankel functions of the
first and second kinds.

**Cyclic Hankel Functions**

- `cyl_hankel_1(v, x)`: The Hankel function of the first kind:
  \\H_v^{(1)}(x) = J_v(x) + iY_v(x)\\

- `cyl_hankel_2(v, x)`: The Hankel function of the second kind:
  \\H_v^{(2)}(x) = J_v(x) - iY_v(x)\\

Where \\J_v(x)\\ is the Bessel function of the first kind and \\Y_v(x)\\
is the Bessel function of the second kind.

**Spherical Hankel Functions:**

- `sph_hankel_1(v, x)`: The spherical Hankel function of the first kind:
  \\h_v^{(1)}(x) = \sqrt{\frac{\pi}{2}}\frac{1}{\sqrt{\pi}}H\_{v +
  \frac{1}{2}}^{(1)}(x)\\

- `sph_hankel_2(v, x)`: The spherical Hankel function of the second
  kind: \\h_v^{(2)}(x) = \sqrt{\frac{\pi}{2}}\frac{1}{\sqrt{\pi}}H\_{v +
  \frac{1}{2}}^{(2)}(x)\\

## Usage

``` r
cyl_hankel_1(v, x)

cyl_hankel_2(v, x)

sph_hankel_1(v, x)

sph_hankel_2(v, x)
```

## Arguments

- v:

  Order of the Hankel function (can be any real number)

- x:

  Argument of the Hankel function (can be any real number)

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
