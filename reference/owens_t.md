# Owens T Function

Computes Owen's T function T(h, a), which gives the probability of the
event (X \> h and 0 \< Y \< a\*X) where X and Y are independent standard
normal random variables.

\$\$T(h,a)=\frac{1}{2\pi}\int\_{0}^{a}\frac{\exp\\\left\\-\tfrac{1}{2}h^{2}(1+x^{2})\right\\}{1+x^{2}}\\dx,\quad
(-\infty\<h,a\<+\infty)\$\$

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
