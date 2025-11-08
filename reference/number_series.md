# Number Series

Functions to compute Bernoulli numbers, tangent numbers, fibonacci
numbers, and prime numbers.

## Usage

``` r
bernoulli_b2n(n = NULL, start_index = NULL, number_of_bernoullis_b2n = NULL)

max_bernoulli_b2n()

unchecked_bernoulli_b2n(n)

tangent_t2n(n = NULL, start_index = NULL, number_of_tangent_t2n = NULL)

prime(n)

max_prime()

fibonacci(n)

unchecked_fibonacci(n)
```

## Arguments

- n:

  Index of number to compute (must be a non-negative integer)

- start_index:

  The starting index for the range of numbers (must be a non-negative
  integer)

- number_of_bernoullis_b2n:

  The number of Bernoulli numbers to compute

- number_of_tangent_t2n:

  The number of tangent numbers to compute

## Value

A single numeric value for the Bernoulli numbers, tangent numbers,
fibonacci numbers, or prime numbers, or a vector of values for ranges.

## Details

Efficient computation of Bernoulli numbers, tangent numbers, fibonacci
numbers, and prime numbers.

The `checked_` functions ensure that the input is within valid bounds,
while the `unchecked_` functions do not perform such checks, allowing
for potentially faster computation at the risk of overflow or invalid
input.

The `max_` functions return the maximum index for which the respective
numbers can be computed using precomputed lookup tables.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/number_series.html)
for more details on the mathematical background.

## Examples

``` r
bernoulli_b2n(10)
#> [1] -529.1242
max_bernoulli_b2n()
#> [1] 129
unchecked_bernoulli_b2n(10)
#> [1] -529.1242
bernoulli_b2n(start_index = 0, number_of_bernoullis_b2n = 10)
#>  [1]  1.00000000  0.16666667 -0.03333333  0.02380952 -0.03333333  0.07575758
#>  [7] -0.25311355  1.16666667 -7.09215686 54.97117794
tangent_t2n(10)
#> [1] 2.908889e+13
tangent_t2n(start_index = 0, number_of_tangent_t2n = 10)
#>  [1]            0            1            2           16          272
#>  [6]         7936       353792     22368256   1903757312 209865342976
prime(10)
#> [1] 31
max_prime()
#> [1] 9999
fibonacci(10)
#> [1] 55
unchecked_fibonacci(10)
#> [1] 55
```
