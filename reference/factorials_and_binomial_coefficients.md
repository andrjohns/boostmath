# Factorials and Binomial Coefficients

Functions to compute factorials, double factorials, rising and falling
factorials (Pochhammer symbols), and binomial coefficients.

These fundamental combinatorial functions appear in counting problems,
probability distributions, and series expansions of special functions.

**Factorial Functions:**

- `factorial_boost(i)`: Computes \\i! = 1\*2\*3\*...\*i\\

  - Standard factorial with overflow checking

  - Returns error for \\i\\ \> max_factorial()

- `unchecked_factorial(i)`: Fast table lookup for small factorials

  - No overflow checking, assumes \\i\\ is valid

  - Use when performance is critical and i is known to be small

- `max_factorial()`: Returns the largest \\i\\ for which
  \\factorial_boost(i)\\ fits in the return type without overflow

**Double Factorial:**

- `double_factorial(i)`: Computes \\i!! = i\*(i-2)\*(i-4)\*...\\

  - For even i: \\i!! = i\*(i-2)\*...\*4\*2\\

  - For odd i: \\i!! = i\*(i-2)\*...\*3\*1\\

**Rising and Falling Factorials (Pochhammer Symbols):**

- `rising_factorial(x, i)`: Computes \\x^{(i)} = x(x+1)(x+2)...(x+i-1)\\

  - Also called Pochhammer symbol or ascending factorial

  - Used in hypergeometric functions and series expansions

  - For integer \\x\\, equals \\(x+i-1)! / (x-1)!\\

- `falling_factorial(x, i)`: Computes \\(x)\_i = x(x-1)(x-2)...(x-i+1)\\

  - Also called descending factorial

  - Counts permutations: number of ways to arrange i items from x items

  - For integer \\x\\, \\equals x! / (x-i)!\\

**Binomial Coefficients:**

- `binomial_coefficient(n, k)`: Computes \\C(n,k) = n! / (k!(n-k)!)\\

  - "n choose k": number of ways to choose \\k\\ items from \\n\\ items

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

  Non-negative integer input for factorials and double factorials

- x:

  Base value for rising and falling factorials (can be real-valued)

- n:

  Total number of elements for binomial coefficients

- k:

  Number of elements to choose for binomial coefficients (0 \<= k \<= n)

## Value

A single numeric value with the computed factorial, double factorial,
rising factorial, falling factorial, or binomial coefficient.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/factorials.html)
for more details on the mathematical background.

## Examples

``` r
# Factorial of 5: 5! = 120
factorial_boost(5)
#> [1] 120
# Unchecked factorial of 5 (fast table lookup)
unchecked_factorial(5)
#> [1] 120
# Maximum factorial value that can be computed
max_factorial()
#> [1] 170
# Double factorial: 6!! = 6*4*2 = 48
double_factorial(6)
#> [1] 48
# Rising factorial: 3^(2) = 3*4 = 12
rising_factorial(3, 2)
#> [1] 12
# Falling factorial: 3^[2] = 3*2 = 6
falling_factorial(3, 2)
#> [1] 6
# Binomial coefficient: C(5,2) = 10
binomial_coefficient(5, 2)
#> [1] 10
```
