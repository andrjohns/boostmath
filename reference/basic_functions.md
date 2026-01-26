# Basic Mathematical Functions

High-precision implementations of basic mathematical functions with
enhanced numerical stability for special cases.

These functions provide numerically stable alternatives to standard
operations, particularly useful when working with values near zero or
when high precision is required.

**Trigonometric Functions with \\\pi\\:**

- `sin_pi(x)`: Computes \\\sin(\pi x)\\

- `cos_pi(x)`: Computes \\\cos(\pi x)\\

**Logarithmic and Exponential Functions:**

- `log1p_boost(x)`: Computes \\\log(1 + x)\\ accurately for small
  \\\|x\|\\

- `expm1_boost(x)`: Computes \\\exp(x) - 1\\ accurately for small
  \\\|x\|\\

**Root Functions:**

- `cbrt(x)`: Computes the cube root \\x^{1/3}\\

- `sqrt1pm1(x)`: Computes \\\sqrt{1 + x} - 1\\ accurately for small
  \\\|x\|\\

- `rsqrt(x)`: Computes the reciprocal square root
  \\\tfrac{1}{\sqrt{x}}\\

**Power Functions:**

- `powm1(x, y)`: Computes \\x^y - 1\\ accurately

**Geometric Functions:**

- `hypot(x, y)`: Computes \\\sqrt{x^2 + y^2}\\ without
  overflow/underflow

## Usage

``` r
sin_pi(x)

cos_pi(x)

log1p_boost(x)

expm1_boost(x)

cbrt(x)

sqrt1pm1(x)

powm1(x, y)

hypot(x, y)

rsqrt(x)
```

## Arguments

- x:

  Input numeric value

- y:

  Second input numeric value (for power and hypotenuse functions)

## Value

A single numeric value with the computed result of the function.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/powers.html)
for more details on the mathematical background.

## Examples

``` r
# sin(π/2) = 1 (exact)
sin_pi(0.5)
#> [1] 1
# cos(π/2) = 0 (exact)
cos_pi(0.5)
#> [1] 0
# log(1 + x) for small x
log1p_boost(0.001)
#> [1] 0.0009995003
# exp(x) - 1 for small x
expm1_boost(0.001)
#> [1] 0.0010005
# Cube root
cbrt(8)  # Returns 2
#> [1] 2
# sqrt(1 + x) - 1 for small x
sqrt1pm1(0.001)
#> [1] 0.0004998751
# x^y - 1 accurately
powm1(2, 3)  # Returns 7 (2^3 - 1)
#> [1] 7
# Euclidean distance
hypot(3, 4)  # Returns 5
#> [1] 5
# Reciprocal square root
rsqrt(4)  # Returns 0.5
#> [1] 0.5
```
