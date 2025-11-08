# Factorials and Binomial Coefficients

Functions to compute factorials, double factorials, rising and falling
factorials, and binomial coefficients.

## Usage

``` r
factorial_boost(i)

unchecked_factorial(i)

max_factorial()

double_factorial(i)

rising_factorial(x, i)

falling_factorial(x, i)

binomial_coefficient(n, k)
```

## Arguments

- i:

  Non-negative integer input for factorials and double factorials.

- x:

  Base value for rising and falling factorials.

- n:

  Total number of elements for binomial coefficients.

- k:

  Number of elements to choose for binomial coefficients.

## Value

A single numeric value with the computed factorial, double factorial,
rising factorial, falling factorial, or binomial coefficient.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/factorials.html)
for more details on the mathematical background.

## Examples

``` r
# Factorial of 5
factorial_boost(5)
#> [1] 120
# Unchecked factorial of 5 (using table lookup)
unchecked_factorial(5)
#> [1] 120
# Maximum factorial value that can be computed
max_factorial()
#> [1] 170
# Double factorial of 6
double_factorial(6)
#> [1] 48
# Rising factorial of 3 with exponent 2
rising_factorial(3, 2)
#> [1] 12
# Falling factorial of 3 with exponent 2
falling_factorial(3, 2)
#> [1] 6
# Binomial coefficient "5 choose 2"
binomial_coefficient(5, 2)
#> [1] 10
```
