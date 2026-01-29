# Chebyshev Polynomials and Related Functions

Functions to compute Chebyshev polynomials of the first and second kind,
and efficiently evaluate Chebyshev series using Clenshaw's recurrence
algorithm.

Chebyshev polynomials are orthogonal polynomials used extensively in
approximation theory, numerical analysis, and spectral methods. They
minimize the Runge phenomenon in polynomial interpolation.

**Chebyshev Polynomials of the First Kind T_n(x):**

- `chebyshev_t(n, x)`: Evaluates \\T_n(x)\\

- Recurrence relation: \\T\_{n+1}(x) = 2xT_n(x) - T\_{n-1}(x)\\ for n \>
  0

- Initial conditions: T_0(x) = 1, T_1(x) = x

- `chebyshev_t_prime(n, x)`: Derivative of T_n(x)

- Stable evaluation for x in \\\[-1, 1\]\\ (mixed forward-backward
  stable)

**Chebyshev Polynomials of the Second Kind U_n(x):**

- `chebyshev_u(n, x)`: Evaluates U_n(x)

- Related to T_n by differentiation

**Recurrence Relation:**

- `chebyshev_next(x, Tn, Tn_1)`: Computes \\T\_{n+1}(x)\\ from T_n and
  \\T\_{n-1}\\

**Clenshaw's Recurrence Algorithm:**

Efficient O(n) evaluation of Chebyshev series (alternative to O(n^2)
direct computation):

- `chebyshev_clenshaw_recurrence(c, x)`: Evaluates Chebyshev series with
  coefficients c at point x on standard interval \\\[-1, 1\]\\

- `chebyshev_clenshaw_recurrence_ab(c, a, b, x)`: Evaluates Chebyshev
  series on arbitrary interval \\\[a, b\]\\ using Reinsch's modification

**Stability:**

Evaluation by three-term recurrence is known to be mixed
forward-backward stable for x in \\\[-1, 1\]\\. Stability outside this
interval is not established.

## Usage

``` r
chebyshev_next(x, Tn, Tn_1)

chebyshev_t(n, x)

chebyshev_u(n, x)

chebyshev_t_prime(n, x)

chebyshev_clenshaw_recurrence(c, x)

chebyshev_clenshaw_recurrence_ab(c, a, b, x)
```

## Arguments

- x:

  Argument of the polynomial (typically in \\\[-1, 1\]\\ for stability)

- Tn:

  Value of the Chebyshev polynomial T_n(x)

- Tn_1:

  Value of the Chebyshev polynomial \\T\_{n-1}(x)\\

- n:

  Degree of the polynomial

- c:

  Vector of coefficients for the Chebyshev series

- a:

  Lower bound of the interval (for interval transformation)

- b:

  Upper bound of the interval (for interval transformation)

## Value

A single numeric value with the computed Chebyshev polynomial or series
evaluation.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly/chebyshev.html)
for more details on the mathematical background.

## Examples

``` r
# Chebyshev polynomial of the first kind T_2(0.5)
chebyshev_t(2, 0.5)
#> [1] -0.5
# Chebyshev polynomial of the second kind U_2(0.5)
chebyshev_u(2, 0.5)
#> [1] 0
# Derivative of the Chebyshev polynomial of the first kind T_2'(0.5)
chebyshev_t_prime(2, 0.5)
#> [1] 2
# Next Chebyshev polynomial of the first kind T_3(0.5) using T_2(0.5) and T_1(0.5)
chebyshev_next(0.5, chebyshev_t(2, 0.5), chebyshev_t(1, 0.5))
#> [1] -1
# Evaluate Chebyshev series with Clenshaw's algorithm
chebyshev_clenshaw_recurrence(c(1, 0, -1), 0.5)
#> [1] 1
# Evaluate Chebyshev series on interval [0, 1]
chebyshev_clenshaw_recurrence_ab(c(1, 0, -1), 0, 1, 0.5)
#> [1] 1.5
```
