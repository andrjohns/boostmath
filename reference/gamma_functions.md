# Gamma Functions

Functions to compute the gamma function, its logarithm, digamma,
trigamma, polygamma, and various incomplete gamma functions.

**Gamma Function Gamma(z):**

- `tgamma(z)`: Computes \\\Gamma(z)\\, the true gamma function

- `tgamma1pm1(z)`: Computes \\\Gamma(1+z) - 1\\ with enhanced numerical
  stability for very small z values, avoiding precision loss

- `lgamma_boost(z)`: Returns \\\log(\Gamma(z))\\, the logarithm of the
  gamma function

**Derivative Functions:**

- `digamma_boost(z)`: The digamma function, the first derivative of the
  logarithm of the Gamma function \\\psi(z) = \frac{d}{dz}\log\Gamma(z)
  = \frac{\Gamma'(z)}{\Gamma(z)}\\,

- `trigamma_boost(z)`: The trigamma function, the second derivative of
  the logarithm of the Gamma function \\\psi_1(z) =
  \frac{d^2}{dz^2}\log\Gamma(z)\\

- `polygamma(n, z)`: The nth derivative of the digamma function (n-th
  order polygamma) \\\psi^{(m)}(z) = \frac{d^m}{dz^m}\psi(z)\\

**Ratios:**

- `tgamma_ratio(a, b)`: Computes \\\Gamma(a)/\Gamma(b)\\

- `tgamma_delta_ratio(a, delta)`: Computes \\\Gamma(a)/\Gamma(a +
  \delta)\\

**Incomplete Gamma Functions:**

These functions require a \> 0 and z \>= 0.

- **Normalised (Regularised) Functions** (return values in \\\[0,
  1\]\\):

  - `gamma_p(a, z)`: Normalised lower incomplete gamma \\P(a, z) =
    \frac{\gamma(a, z)}{\Gamma(z)}\\

  - `gamma_q(a, z)`: Normalised upper incomplete gamma \\Q(a, z) =
    \frac{\Gamma(a, z)}{\Gamma(a)}\\

- **Non-normalised Functions** (return values in \\\[0, Gamma(a)\]\\):

  - `tgamma_lower(a, z)`: Full lower incomplete gamma function
    \\\gamma(a, z) = \int\_{0}^z t^{a-1}e^{-t}dt\\

  - `tgamma_upper(a, z)`: Full upper incomplete gamma function
    \\\Gamma(a, z) = \int\_{z}^\Infty t^{a-1}e^{-t}dt\\

**Inverse Functions:**

- `gamma_p_inv(a, p)`: Returns \\z\\ such that \\p = P(a, z)\\

- `gamma_q_inv(a, q)`: Returns \\z\\ such that \\q = Q(a, z)\\

- `gamma_p_inva(z, p)`: Returns \\a\\ such that \\p = P(a, z)\\

- `gamma_q_inva(z, q)`: Returns \\a\\ such that \\q = Q(a, z)\\

**Derivative:**

- `gamma_p_derivative(a, z)`: Computes the derivative of the normalised
  lower incomplete gamma function with respect to z:
  \\\frac{\partial}{\partial z}P(a, z) =
  \frac{e^{-z}z^{a-1}}{\Gamma(a)}\\

## Usage

``` r
tgamma(z)

tgamma1pm1(z)

lgamma_boost(z)

digamma_boost(z)

trigamma_boost(z)

polygamma(n, z)

tgamma_ratio(a, b)

tgamma_delta_ratio(a, delta)

gamma_p(a, z)

gamma_q(a, z)

tgamma_lower(a, z)

tgamma_upper(a, z)

gamma_q_inv(a, q)

gamma_p_inv(a, p)

gamma_q_inva(z, q)

gamma_p_inva(z, p)

gamma_p_derivative(a, z)
```

## Arguments

- z:

  Input numeric value for the gamma function

- n:

  Order of the polygamma function (non-negative integer)

- a:

  Argument for the incomplete gamma functions (must be positive)

- b:

  Denominator argument for the ratio of gamma functions

- delta:

  Increment for the ratio of gamma functions

- q:

  Probability value for the incomplete gamma functions (0 \<= q \<= 1)

- p:

  Probability value for the incomplete gamma functions (0 \<= p \<= 1)

## Value

A single numeric value with the computed gamma function, logarithm,
digamma, trigamma, polygamma, or incomplete gamma functions.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_gamma.html)
for more details on the mathematical background.

## Examples

``` r
if (FALSE) { # \dontrun{
# Gamma function for z = 5
tgamma(5)
# Gamma function for (1 + z) - 1, where z = 5
tgamma1pm1(5)
# Logarithm of the gamma function for z = 5
lgamma_boost(5)
# Digamma function for z = 5
digamma_boost(5)
# Trigamma function for z = 5
trigamma_boost(5)
# Polygamma function of order 1 for z = 5
polygamma(1, 5)
# Ratio of gamma functions for a = 5, b = 3
tgamma_ratio(5, 3)
# Ratio of gamma functions with delta for a = 5, delta = 2
tgamma_delta_ratio(5, 2)
# Normalised lower incomplete gamma function P(a, z) for a = 5, z = 2
gamma_p(5, 2)
# Normalised upper incomplete gamma function Q(a, z) for a = 5, z = 2
gamma_q(5, 2)
# Full lower incomplete gamma function for a = 5, z = 2
tgamma_lower(5, 2)
# Full upper incomplete gamma function for a = 5, z = 2
tgamma_upper(5, 2)
# Inverse of the normalised upper incomplete gamma function for a = 5, q = 0.5
gamma_q_inv(5, 0.5)
# Inverse of the normalised lower incomplete gamma function for a = 5, p = 0.5
gamma_p_inv(5, 0.5)
# Inverse of the normalised upper incomplete gamma function with respect to a for z = 2, q = 0.5
gamma_q_inva(2, 0.5)
# Inverse of the normalised lower incomplete gamma function with respect to a for z = 2, p = 0.5
gamma_p_inva(2, 0.5)
# Derivative of the normalised lower incomplete gamma function for a = 5, z = 2
gamma_p_derivative(5, 2)
} # }
```
