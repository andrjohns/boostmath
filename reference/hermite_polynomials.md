# Hermite Polynomials and Related Functions

Functions to compute Hermite polynomials.

## Usage

``` r
hermite(n, x)

hermite_next(n, x, Hn, Hnm1)
```

## Arguments

- n:

  Degree of the polynomial

- x:

  Argument of the polynomial

- Hn:

  Value of the Hermite polynomial \\(H_n(x))\\

- Hnm1:

  Value of the Hermite polynomial \\(H\_{n-1}(x))\\

## Value

A single numeric value with the computed Hermite polynomial or its next
value.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/hermite.html)
for more details on the mathematical background.

## Examples

``` r
# Hermite polynomial H_2(0.5)
hermite(2, 0.5)
#> [1] -1
# Next Hermite polynomial H_3(0.5) using H_2(0.5) and H_1(0.5)
hermite_next(2, 0.5, hermite(2, 0.5), hermite(1, 0.5))
#> [1] -5
```
