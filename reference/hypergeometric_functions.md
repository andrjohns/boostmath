# Hypergeometric Functions

Functions to compute various hypergeometric functions.

## Usage

``` r
hypergeometric_1F0(a, z)

hypergeometric_0F1(b, z)

hypergeometric_2F0(a1, a2, z)

hypergeometric_1F1(a, b, z)

hypergeometric_1F1_regularized(a, b, z)

log_hypergeometric_1F1(a, b, z)

hypergeometric_pFq(a, b, z)
```

## Arguments

- a:

  Parameter of the hypergeometric function

- z:

  Argument of the hypergeometric function

- b:

  Second parameter of the hypergeometric function

- a1:

  First parameter of the hypergeometric function

- a2:

  Second parameter of the hypergeometric function

## Value

A single numeric value with the computed hypergeometric function.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/hypergeometric.html)
for more details on the mathematical background.

## Examples

``` r
# Hypergeometric Function 1F0
hypergeometric_1F0(2, 0.2)
#> [1] 1.5625
# Hypergeometric Function 0F1
hypergeometric_0F1(1, 0.8)
#> [1] 1.974957
# Hypergeometric Function 2F0
hypergeometric_2F0(0.1, -1, 0.1)
#> [1] 0.99
# Hypergeometric Function 1F1
hypergeometric_1F1(2, 3, 1)
#> [1] 2
# Regularised Hypergeometric Function 1F1
hypergeometric_1F1_regularized(2, 3, 1)
#> [1] 1
# Logarithm of the Hypergeometric Function 1F1
log_hypergeometric_1F1(2, 3, 1)
#> [1] 0.6931472
#> attr(,"sign")
#> [1] 1
# Hypergeometric Function pFq
hypergeometric_pFq(c(2, 3), c(4, 5), 6)
#> [1] 11.32427
```
