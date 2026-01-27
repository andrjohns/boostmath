# Beta Functions

Functions to compute the Beta function, normalized incomplete beta
function, and their complements, as well as their inverses and
derivatives.

**Beta Function \\B(a, b)\\:**

- `beta_boost(a, b)`

\$\$B(a, b) = \frac{\Gamma(a)\Gamma(b)}{\Gamma(a+b)}\$\$

**Incomplete Beta Functions:**

- **Normalized (Regularized) Functions:**

  - `ibeta(a, b, x)`: Normalized incomplete beta function \\I_x(a, b)\\

\$\$I_x(a,b) = \frac{1}{B(a, b)}\int\_{0}^{x}t^{a-1}(1-t)^{b-1}dt\$\$

- `ibetac(a, b, x)`: Normalized complement, \\1 - I_x(a, b) =
  I\_{1-x}(b, a)\\

&nbsp;

- **Non-normalized Functions:**

  - `beta_boost(a, b, x)`: Full incomplete beta function \\B_x(a, b)\\

\$\$\int\_{0}^{x}t^{a-1}(1-t)^{b-1}dt\$\$

- `betac(a, b, x)`: Full complement , \\1 - B_x(a, b) = B\_{1-x}(b, a)\\

**Inverse Functions:**

- **Primary inverses (solving for x):**

  - `ibeta_inv(a, b, p)`: Returns \\x\\ such that \\p = I_x(a, b)\\

  - `ibetac_inv(a, b, q)`: Returns \\x\\ such that \\q = 1 - I_x(a, b)\\

- **Parameter inverses (solving for a or b):**

  - `ibeta_inva(b, x, p)`: Returns a such that \\p\\ = I_x(a, b)

  - `ibetac_inva(b, x, q)`: Returns a such that \\q\\ = 1 - I_x(a, b)

  - `ibeta_invb(a, x, p)`: Returns b such that \\p\\ = I_x(a, b)

  - `ibetac_invb(a, x, q)`: Returns b such that \\q\\ = 1 - I_x(a, b)

**Derivatives:**

`ibeta_derivative(a, b, x)`: Computes the partial derivative with
respect to x of the incomplete beta function

\$\$\frac{\partial}{\partial x}I_x(a,b) =
\frac{(1-x)^{b-1}x^{a-1}}{B(a,b)}\$\$

## Usage

``` r
beta_boost(a, b, x = NULL)

ibeta(a, b, x)

ibetac(a, b, x)

betac(a, b, x)

ibeta_inv(a, b, p)

ibetac_inv(a, b, q)

ibeta_inva(b, x, p)

ibetac_inva(b, x, q)

ibeta_invb(a, x, p)

ibetac_invb(a, x, q)

ibeta_derivative(a, b, x)
```

## Arguments

- a:

  First parameter of the beta function (must be positive)

- b:

  Second parameter of the beta function (must be positive)

- x:

  Upper limit of integration (0 \<= x \<= 1)

- p:

  Probability value (0 \<= p \<= 1)

- q:

  Probability value (0 \<= q \<= 1), where q = 1 - p

## Value

A single numeric value with the computed beta function, normalized
incomplete beta function, or their complements, depending on the
function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_beta.html)
for more details on the mathematical background.

## Examples

``` r
if (FALSE) { # \dontrun{
# Euler beta function B(2, 3)
beta_boost(2, 3)
# Normalized incomplete beta function I_x(2, 3) for x = 0.5
ibeta(2, 3, 0.5)
# Normalized complement of the incomplete beta function 1 - I_x(2, 3) for x = 0.5
ibetac(2, 3, 0.5)
# Full incomplete beta function B_x(2, 3) for x = 0.5
beta_boost(2, 3, 0.5)
# Full complement of the incomplete beta function 1 - B_x(2, 3) for x = 0.5
betac(2, 3, 0.5)
# Inverse of the normalized incomplete beta function I_x(2, 3) = 0.5
ibeta_inv(2, 3, 0.5)
# Inverse of the normalized complement of the incomplete beta function I_x(2, 3) = 0.5
ibetac_inv(2, 3, 0.5)
# Inverse of the normalized complement of the incomplete beta function I_x(a, b)
# with respect to a for x = 0.5 and q = 0.5
ibetac_inva(3, 0.5, 0.5)
# Inverse of the normalized incomplete beta function I_x(a, b)
# with respect to b for x = 0.5 and p = 0.5
ibeta_invb(0.8, 0.5, 0.5)
# Inverse of the normalized complement of the incomplete beta function I_x(a, b)
# with respect to b for x = 0.5 and q = 0.5
ibetac_invb(2, 0.5, 0.5)
# Derivative of the incomplete beta function with respect to x for a = 2, b = 3, x = 0.5
ibeta_derivative(2, 3, 0.5)
} # }
```
