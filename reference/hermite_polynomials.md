# Hermite Polynomials and Related Functions

Functions to compute Hermite polynomials using three-term recurrence
relations.

Hermite polynomials are orthogonal polynomials that appear in
probability theory (as derivatives of the Gaussian function), quantum
mechanics (quantum harmonic oscillator), and numerical analysis.

**Hermite Polynomials H_n(x):**

- `hermite(n, x)`: Evaluates the Hermite polynomial of degree n at point
  x

- Orthogonal with respect to the weight function \$\$e^{-x^2}\$\$ on
  (-Inf, Inf)

- Appear as eigenfunctions of the quantum harmonic oscillator

**Recurrence Relation:**

- `hermite_next(n, x, Hn, Hnm1)`: Computes \$\$H\_{n+1}(x)\$\$ from H_n
  and \$\$H\_{n-1}\$\$

- Uses stable three-term recurrence for sequential computation

**Implementation Notes:**

- Guarantees low absolute error but not low relative error near
  polynomial roots

- Values greater than ~120 for n are unlikely to produce sensible
  results

- Relative errors may grow arbitrarily large when the function is very
  close to a root

## Usage

``` r
hermite(n, x)

hermite_next(n, x, Hn, Hnm1)
```

## Arguments

- n:

  Degree of the polynomial (practical limit ~120)

- x:

  Argument of the polynomial

- Hn:

  Value of the Hermite polynomial H_n(x)

- Hnm1:

  Value of the Hermite polynomial \$\$H\_{n-1}(x)\$\$

## Value

A single numeric value with the computed Hermite polynomial.

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
