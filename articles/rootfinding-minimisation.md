# Boost Math - Root Finding and Minimisation Algorithms

## Root Finding & Minimisation Algorithms

The [Root Finding & Minimization
Algorithms](https://www.boost.org/doc/libs/latest/libs/math/doc/html/root_finding.html)
section of the Boost Math library provides methods for finding minima
and roots of functions. These methods can be used directly in R without
needing any additional compilation.

### [Root Finding Without Derivatives](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/roots_noderiv.html)

``` r
# Example of finding a root using bisection method
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
# Example of finding a root using bracket and solve method
f <- function(x) x^2 - 2
bracket_and_solve_root(f, guess = 1, factor = 0.1, rising = TRUE)
#> $lower
#> [1] 1.414214
#> 
#> $upper
#> [1] 1.414214
#> 
#> $iterations
#> [1] 91
# Example of finding a root using TOMS 748 algorithm
f <- function(x) x^2 - 2
toms748_solve(f, lower = 0, upper = 2)
#> $lower
#> [1] 1.414214
#> 
#> $upper
#> [1] 1.414214
#> 
#> $iterations
#> [1] 9
```

### [Root Finding With Derivatives](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/roots_deriv.html)

``` r
# Example of finding a root using Newton-Raphson method
f <- function(x) c(x^2 - 2, 2 * x)
newton_raphson_iterate(f, guess = 1, lower = 0, upper = 2)
#> [1] 1.414214
#> attr(,"iterations")
#> [1] 6
# Example of finding a root using Halley's method
f <- function(x) c(x^2 - 2, 2 * x, 2)
halley_iterate(f, guess = 1, lower = 0, upper = 2)
#> [1] 1.414214
#> attr(,"iterations")
#> [1] 4
# Example of finding a root using Schroder's method
f <- function(x) c(x^2 - 2, 2 * x, 2)
schroder_iterate(f, guess = 1, lower = 0, upper = 2)
#> [1] 1.414214
#> attr(,"iterations")
#> [1] 5
```

### Polynomial Roots

#### [Quadratic Roots](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/roots_deriv.html#math_toolkit.roots_deriv.quadratics)

``` r
# Example of finding quadratic roots
quadratic_roots(1, -3, 2)
#> [1] 1 2
```

#### [Cubic Roots](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/cubic_roots.html)

``` r
# Example of finding cubic roots
cubic_roots(1, -6, 11, -6)
#> [1] 1 2 3
# Example of finding cubic root residual
cubic_root_residual(1, -6, 11, -6, 1)
#> [1] 0.000000e+00 1.110223e-14
# Example of finding cubic root condition number
cubic_root_condition_number(1, -6, 11, -6, 1)
#> [1] 12
```

#### [Quartic Roots](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/quartic_roots.html)

``` r
# Example of finding quartic roots
quartic_roots(1, -10, 35, -50, 24)
#> [1] 1 2 3 4
```

### [Finding Function Minima with Brent’s Algorithm](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/brent_minima.html)

``` r
# Example of finding a minimum using Brent's method
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
```
