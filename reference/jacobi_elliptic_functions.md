# Jacobi Elliptic Functions

Functions to compute the Jacobi elliptic functions, which are doubly
periodic generalizations of trigonometric and hyperbolic functions.

Jacobi elliptic functions are fundamental in the theory of elliptic
functions and appear in solutions to nonlinear differential equations,
including the pendulum equation, and in the theory of elliptic curves.

**Three Principal Functions:**

The three copolar Jacobi elliptic functions are:

- **sn(u, k)** - Sine amplitude

- **cn(u, k)** - Cosine amplitude

- **dn(u, k)** - Delta amplitude

These satisfy the fundamental identity: sn^2 + cn^2 = 1 and dn^2 +
k^2sn^2 = 1

**Parameter Notation:**

- k = elliptic modulus (used in this implementation)

- Alternative notations: m = k^2 (parameter), alpha = modular angle
  where k = sin(alpha)

**Special Cases:**

- sn(0, k) = 0; cn(0, k) = dn(0, k) = 1

- When k = 0: sn(u, 0) = sin(u); cn(u, 0) = cos(u); dn(u, 0) = 1

- When k = 1: sn(u, 1) = tanh(u); cn(u, 1) = dn(u, 1) = sech(u)

**Derived Functions:**

Twelve Jacobi elliptic functions exist, derived from ratios of sn, cn,
dn:

- cd = cn/dn, cs = cn/sn, dc = dn/cn, ds = dn/sn

- nc = 1/cn, nd = 1/dn, ns = 1/sn

- sc = sn/cn, sd = sn/dn

All functions satisfy double periodicity and various addition formulas
analogous to trigonometric identities.

**Implementation:**

Values are calculated using the arithmetic-geometric mean (AGM) method.
For k \> 1, transformation relations apply the complementary modulus.
The function `jacobi_elliptic(k, u)` returns all three principal
functions simultaneously for efficiency.

## Usage

``` r
jacobi_elliptic(k, u)

jacobi_cd(k, u)

jacobi_cn(k, u)

jacobi_cs(k, u)

jacobi_dc(k, u)

jacobi_dn(k, u)

jacobi_ds(k, u)

jacobi_nc(k, u)

jacobi_nd(k, u)

jacobi_ns(k, u)

jacobi_sc(k, u)

jacobi_sd(k, u)

jacobi_sn(k, u)
```

## Arguments

- k:

  Elliptic modulus (typically 0 \<= k \<= 1, but k \> 1 uses
  complementary relations)

- u:

  Argument of the elliptic functions

## Value

For `jacobi_elliptic`, a list containing the values of the Jacobi
elliptic functions: `sn`, `cn`, `dn`. For individual functions, a single
numeric value is returned.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/jacobi.html)
for more details on the mathematical background.

## Examples

``` r
# All three principal Jacobi Elliptic Functions at once
k <- 0.5
u <- 2
jacobi_elliptic(k, u)
#> $sn
#> [1] 0.9628982
#> 
#> $cn
#> [1] -0.269865
#> 
#> $dn
#> [1] 0.8764741
#> 
# Individual Jacobi Elliptic Functions
jacobi_cd(k, u)
#> [1] -0.3078984
jacobi_cn(k, u)
#> [1] -0.269865
jacobi_cs(k, u)
#> [1] -0.2802632
jacobi_dc(k, u)
#> [1] -3.247825
jacobi_dn(k, u)
#> [1] 0.8764741
jacobi_ds(k, u)
#> [1] 0.9102458
jacobi_nc(k, u)
#> [1] -3.705557
jacobi_nd(k, u)
#> [1] 1.140935
jacobi_ns(k, u)
#> [1] 1.038531
jacobi_sc(k, u)
#> [1] -3.568074
jacobi_sd(k, u)
#> [1] 1.098604
jacobi_sn(k, u)
#> [1] 0.9628982
```
