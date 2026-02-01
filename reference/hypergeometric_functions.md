# Hypergeometric Functions

Functions to compute various hypergeometric functions, which are
solutions to hypergeometric differential equations and generalize many
special functions.

**Specialised Hypergeometric Functions:**

- **hypergeometric_1F0(a, z):** : \$\$\_1F_0(a;z) = \sum\_{n=0}^\infty
  \frac{(a)\_nz^n}{n!}\$\$

- **hypergeometric_0F1(b, z):** : \$\$\_0F_1(;b;z) = \sum\_{n=0}^\infty
  \frac{z^n}{(b)\_n!}\$\$

- **hypergeometric_2F0(a1, a2, z):** : \$\$\_2F_0(a_1, a_2;z) =
  \sum\_{n=0}^\infty \frac{(a_1)\_n(a_2)\_nz^n}{n!}\$\$

- **hypergeometric_1F1(a, b, z):** : \$\$\_1F_1(a, b;z) =
  \sum\_{n=0}^\infty \frac{(a)\_nz^n}{(b)\_n!}\$\$

- **hypergeometric_1F1_regularized(a, b, z):** : \$\$\_1\tilde{F}\_1(a,
  b;z) = \frac{\_1F_1(a, b;z)}{\Gamma(b)}\$\$

- **log_hypergeometric_1F1(a, b, z):** : Numerically stable
  implementation of \\\ln \_1F_1(a, b;z)\\

**Generalised Hypergeometric Function pFq:**

- `hypergeometric_pFq(a, b, z)`: General form with p numerator
  parameters and q denominator parameters:

\$\$\_pF_q\left(\\a_1,...,a_p\\, \\b_1,...,b_q\\; z\right) =
\sum\_{n=0}^{\infty}
\frac{\prod\_{j=1}^{p}(a_j)\_n}{\prod\_{j=1}^{q}(b_j)\_n}\frac{z^n}{n!}\$\$

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

  Parameter of the hypergeometric function (numerator parameter)

- z:

  Argument of the hypergeometric function

- b:

  Denominator parameter of the hypergeometric function

- a1:

  First numerator parameter (for 2F0)

- a2:

  Second numerator parameter (for 2F0)

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
# Hypergeometric Function 1F1 (Kummer's function)
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
# Generalised Hypergeometric Function pFq (3F4 example)
hypergeometric_pFq(c(2, 3, 4), c(5, 6, 7, 8), 0.5)
#> [1] 1.007178
```
