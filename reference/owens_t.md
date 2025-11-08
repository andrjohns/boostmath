# Owens T Function

Computes the Owens T function of h and a, giving the probability of the
event (X \> h and 0 \< Y \< a \* X) where X and Y are independent
standard normal random variables.

## Usage

``` r
owens_t(h, a)
```

## Arguments

- h:

  The first argument of the Owens T function

- a:

  The second argument of the Owens T function

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
