# Owens T Function

Computes Owen's T function T(h, a), which gives the probability of the
event (X \> h and 0 \< Y \< a\*X) where X and Y are independent standard
normal random variables.

**Geometric Interpretation:**

For positive h and a, T(h, a) represents the volume of an uncorrelated
bivariate normal distribution with zero means and unit variances over
the region bounded by y = ax, y = 0, and x = h.

**Special Cases:**

- T(h, 0) = 0

- T(0, a) = (1/2pi) arctan(a)

- T(h, 1) = (1/2) Phi(h) \[1 - Phi(h)\], where Phi is the standard
  normal CDF

- T(h, Inf) = Phi(\|h\|)

**Applications:**

Owen's T function is essential for computing the skew normal
distribution and probabilities for bivariate and multivariate normal
distributions. It appears in statistical inference, power calculations,
and various probability computations involving correlated normal
variables.

## Usage

``` r
owens_t(h, a)
```

## Arguments

- h:

  The first argument of the Owens T function (boundary parameter)

- a:

  The second argument of the Owens T function (slope parameter)

## Value

The value of the Owens T function at (h, a).

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/owens_t.html)
for more details on the mathematical background.

## Examples

``` r
# Owens T Function
owens_t(1, 0.5)
#> [1] 0.04306469
```
