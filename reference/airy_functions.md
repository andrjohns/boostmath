# Airy Functions

Functions to compute the Airy functions Ai and Bi, their derivatives,
and their zeros.

## Usage

``` r
airy_ai(x)

airy_bi(x)

airy_ai_prime(x)

airy_bi_prime(x)

airy_ai_zero(m = NULL, start_index = NULL, number_of_zeros = NULL)

airy_bi_zero(m = NULL, start_index = NULL, number_of_zeros = NULL)
```

## Arguments

- x:

  Input numeric value

- m:

  The index of the zero to find (1-based).

- start_index:

  The starting index for the zeros (1-based).

- number_of_zeros:

  The number of zeros to find.

## Value

Single numeric value for the Airy functions and their derivatives, or a
vector of length `number_of_zeros` for the multiple zero functions.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/airy.html)
for more details on the mathematical background.

## Examples

``` r
airy_ai(2)
#> [1] 0.03492413
airy_bi(2)
#> [1] 3.298095
airy_ai_prime(2)
#> [1] -0.05309038
airy_bi_prime(2)
#> [1] 4.100682
airy_ai_zero(1)
#> [1] -2.338107
airy_bi_zero(1)
#> [1] -1.173713
airy_ai_zero(start_index = 1, number_of_zeros = 5)
#> [1] -2.338107 -4.087949 -5.520560 -6.786708 -7.944134
airy_bi_zero(start_index = 1, number_of_zeros = 5)
#> [1] -1.173713 -3.271093 -4.830738 -6.169852 -7.376762
```
