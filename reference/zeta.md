# Riemann Zeta Function

Computes the Riemann zeta function zeta(z), one of the most important
functions in analytic number theory.

**Mathematical Definition:**

The Riemann zeta function is defined by the series: \$\$\zeta(z) =
\sum\_{n=1}^\infty \frac{1}{n^z}\$\$

for Re(z) \> 1, and by analytic continuation elsewhere.

**Special Values:**

- zeta(2) = pi^2/6 (Basel problem)

- zeta(4) = pi^4/90

- zeta(0) = -1/2

- zeta(-1) = -1/12

- Closed forms exist for all even positive integers and all negative
  integers

- For odd positive integers \> 1, values are computed numerically

**Implementation:**

The function uses different computational strategies depending on the
argument:

- For 0 \< z \< 1: Rational approximation form

- For 1 \< z \< 4: Rational approximation around nearby integers

- For z \> 4: Simple rational approximation series

- Reflection formula for negative arguments

- Pre-computed cached values for positive odd integers

- Specialised rational approximations for standard floating-point
  precisions

**Applications:**

The Riemann zeta function appears in number theory (distribution of
primes), physics (quantum field theory, statistical mechanics), and
probability theory. The famous Riemann Hypothesis concerns the
non-trivial zeros of this function.

## Usage

``` r
zeta(z)
```

## Arguments

- z:

  Real number input

## Value

The value of the Riemann zeta function zeta(z).

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/zetas/zeta.html)
for more details on the mathematical background.

## Examples

``` r
# Riemann Zeta Function
zeta(2)  # Should return pi^2 / 6 ~= 1.6449340668
#> [1] 1.644934
zeta(3)  # Apery's constant ~= 1.2020569032
#> [1] 1.202057
zeta(4)  # pi^4 / 90 ~= 1.0823232337
#> [1] 1.082323
```
