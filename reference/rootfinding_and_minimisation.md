# Root-Finding and Minimisation Functions

Functions for root-finding and minimisation using various algorithms.

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

  A function to find the root of or to minimise. It should take and
  return a single numeric value for root-finding, or a numeric vector
  for minimisation.

- lower:

  The lower bound of the interval to search for the root or minimum.

- upper:

  The upper bound of the interval to search for the root or minimum.

- digits:

  The number of significant digits to which the root or minimum should
  be found. Defaults to double precision.

- max_iter:

  The maximum number of iterations to perform. Defaults to the maximum
  integer value.

- guess:

  A numeric value that is a guess for the root or minimum.

- factor:

  Size of steps to take when searching for the root.

- rising:

  If TRUE, the function is assumed to be rising, otherwise it is assumed
  to be falling.

## Value

A list containing the root or minimum value, the value of the function
at that point, and the number of iterations performed.

## Details

This package provides a set of functions for finding roots of equations
and minimising functions using different numerical methods. The methods
include bisection, bracket and solve, TOMS 748, Newton-Raphson, Halley's
method, Schroder's method, and Brent's method. It also includes
functions for finding roots of polynomials (quadratic, cubic, quartic)
and computing minima.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/root_finding.html)
for more details on the mathematical background.

## Examples

``` r
f <- function(x) x^2 - 2
bisect(f, lower = 0, upper = 2)
#> $lower
#> [1] 1.414214
#> 
#> $upper
#> [1] 1.414214
#> 
#> $iterations
#> [1] 54
#> 
bracket_and_solve_root(f, guess = 1, factor = 0.1, rising = TRUE)
#> $lower
#> [1] 1.414214
#> 
#> $upper
#> [1] 1.414214
#> 
#> $iterations
#> [1] 91
#> 
toms748_solve(f, lower = 0, upper = 2)
#> $lower
#> [1] 1.414214
#> 
#> $upper
#> [1] 1.414214
#> 
#> $iterations
#> [1] 9
#> 
f <- function(x) c(x^2 - 2, 2 * x)
newton_raphson_iterate(f, guess = 1, lower = 0, upper = 2)
#> [1] 1.414214
#> attr(,"iterations")
#> [1] 6
f <- function(x) c(x^2 - 2, 2 * x, 2)
halley_iterate(f, guess = 1, lower = 0, upper = 2)
#> [1] 1.414214
#> attr(,"iterations")
#> [1] 4
schroder_iterate(f, guess = 1, lower = 0, upper = 2)
#> [1] 1.414214
#> attr(,"iterations")
#> [1] 5
f <- function(x) (x - 2)^2 + 1
brent_find_minima(f, lower = 0, upper = 4)
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
