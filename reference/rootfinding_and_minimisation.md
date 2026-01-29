# Root-Finding and Minimisation

Functions for finding roots of equations and minimizing functions using
various numerical methods.

**Root Finding Without Derivatives:** These methods require a bracket
(an interval \\\[a, b\]\\ where the function has opposite signs) or a
guess.

- **Bisection (`bisect`):** A robust method that repeatedly subdivides
  the interval. Guaranteed to converge but slowly (linear convergence).

- **TOMS 748 (`toms748_solve`):** An asymptotically efficient algorithm
  (Alefeld, Potra, and Shi) that combines interpolation and bisection.
  It has higher-order convergence and is often optimal for smooth
  functions.

- **Bracket and Solve (`bracket_and_solve_root`):** A convenience
  wrapper that attempts to find a bracket around a guess and then solves
  using TOMS 748.

**Root Finding With Derivatives:** These methods require the user to
provide derivatives of the function.

- **Newton-Raphson (`newton_raphson_iterate`):** Second-order
  convergence. Requires \\f(x)\\ and \\f'(x)\\.

- **Halley's Method (`halley_iterate`):** Third-order convergence.
  Requires \\f(x)\\, \\f'(x)\\, and \\f''(x)\\.

- **Schroder's Method (`schroder_iterate`):** Third-order convergence.
  Similar to Halley's method but more robust ensuring quadratic
  convergence for multiple roots.

**Minimization:**

- **Brent's Method (`brent_find_minima`):** Finds the minimum of a
  function in a given interval. It is a hybrid method using a
  combination of the golden section search and quadratic interpolation.

## Usage

``` r
bisect(
  f,
  lower,
  upper,
  digits = .Machine$double.digits,
  max_iter = .Machine$integer.max
)

bracket_and_solve_root(
  f,
  guess,
  factor,
  rising,
  digits = .Machine$double.digits,
  max_iter = .Machine$integer.max
)

toms748_solve(
  f,
  lower,
  upper,
  digits = .Machine$double.digits,
  max_iter = .Machine$integer.max
)

newton_raphson_iterate(
  f,
  guess,
  lower,
  upper,
  digits = .Machine$double.digits,
  max_iter = .Machine$integer.max
)

halley_iterate(
  f,
  guess,
  lower,
  upper,
  digits = .Machine$double.digits,
  max_iter = .Machine$integer.max
)

schroder_iterate(
  f,
  guess,
  lower,
  upper,
  digits = .Machine$double.digits,
  max_iter = .Machine$integer.max
)

brent_find_minima(
  f,
  lower,
  upper,
  digits = .Machine$double.digits,
  max_iter = .Machine$integer.max
)
```

## Arguments

- f:

  A function to find the root of or to minimise.

  - For **no-derivative** methods: A function returning a single numeric
    value.

  - For **Newton-Raphson**: A function returning a vector
    `c(f(x), f'(x))`.

  - For **Halley/Schroder**: A function returning a vector
    `c(f(x), f'(x), f''(x))`.

  - For **Minimization**: A function returning a single numeric value.

- lower:

  The lower bound of the interval to search.

- upper:

  The upper bound of the interval to search.

- digits:

  The number of significant digits to which the root or minimum should
  be found. Default is double precision.

- max_iter:

  The maximum number of iterations to perform.

- guess:

  A numeric value that is a guess for the root.

- factor:

  Size of steps to take when searching for the root (for
  `bracket_and_solve_root`).

- rising:

  If TRUE, the function is assumed to be rising (for
  `bracket_and_solve_root`).

## Value

A list containing the root or minimum value, the value of the function
at that point, and the number of iterations performed.

## See also

[`polynomial_root_finding`](https://andrjohns.github.io/boostmath/reference/polynomial_root_finding.md)

## Examples

``` r
# --- Root Finding Without Derivatives ---
# Bisection for x^2 - 2 = 0
f_bi <- function(x) x^2 - 2
bisect(f_bi, lower = 0, upper = 2)
#> $lower
#> [1] 1.414214
#> 
#> $upper
#> [1] 1.414214
#> 
#> $iterations
#> [1] 54
#> 

# TOMS 748 for x^2 - 2 = 0
toms748_solve(f_bi, lower = 0, upper = 2)
#> $lower
#> [1] 1.414214
#> 
#> $upper
#> [1] 1.414214
#> 
#> $iterations
#> [1] 9
#> 

# Bracket and Solve
bracket_and_solve_root(f_bi, guess = 1, factor = 2, rising = TRUE)
#> $lower
#> [1] 1.414214
#> 
#> $upper
#> [1] 1.414214
#> 
#> $iterations
#> [1] 10
#> 

# --- Root Finding With Derivatives ---
# Newton-Raphson: Need f(x) and f'(x)
# x^2 - 2 = 0  => f(x) = x^2 - 2, f'(x) = 2x
f_newton <- function(x) c(x^2 - 2, 2 * x)
newton_raphson_iterate(f_newton, guess = 1, lower = 0, upper = 2)
#> [1] 1.414214
#> attr(,"iterations")
#> [1] 6

# Halley/Schroder: Need f(x), f'(x), f''(x)
# x^2 - 2 = 0  => f''(x) = 2
f_halley <- function(x) c(x^2 - 2, 2 * x, 2)
halley_iterate(f_halley, guess = 1, lower = 0, upper = 2)
#> [1] 1.414214
#> attr(,"iterations")
#> [1] 4
schroder_iterate(f_halley, guess = 1, lower = 0, upper = 2)
#> [1] 1.414214
#> attr(,"iterations")
#> [1] 5

# --- Minimization ---
# Find minimum of (x-2)^2 + 1
f_min <- function(x) (x - 2)^2 + 1
brent_find_minima(f_min, lower = 0, upper = 4)
#> $minimum
#> [1] 2
#> 
#> $value
#> [1] 1
#> 
#> $iterations
#> [1] 5
#> 
```
