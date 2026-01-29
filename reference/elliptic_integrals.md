# Elliptic Integrals

Functions to compute various elliptic integrals, including Carlson's
elliptic integrals and incomplete elliptic integrals.

**Elliptic Integrals - Carlson Form**

- `ellint_rf(x, y, z)`: Carlson's Elliptic Integral \\R_F\\

\$\$R_F(x, y, z) =
\frac{1}{2}\int\_{0}^\infty\[(t+x)(t+y)(t+z)\]^{-\frac{1}{2}}dt\$\$

- `ellint_rd(x, y, z)`: Carlson's Elliptic Integral \\R_D\\

\$\$R_D(x, y, z) =
\frac{3}{2}\int\_{0}^\infty\[(t+x)(t+y)\]^{-\frac{1}{2}}(t+z)^{-\frac{3}{2}}dt\$\$

- `ellint_rj(x, y, z, p)`: Carlson's Elliptic Integral \\R_J\\

\$\$R_J(x, y, z) =
\frac{3}{2}\int\_{0}^\infty(t+p)^{-1}\[(t+x)(t+y)(t+z)\]^{-\frac{1}{2}}dt\$\$

- `ellint_rc(x, y)`: Carlson's Elliptic Integral \\R_C\\

\$\$R_C(x, y) =
\frac{1}{2}\int\_{0}^\infty(t+x)^{-\frac{1}{2}}(t+y)^{-1}dt\$\$

- `ellint_rg(x, y, z)`: Carlson's Elliptic Integral \\R_G\\

\$\$R_G(x, y, z) =
\frac{1}{4\pi}\int\_{0}^{2\pi}\int\_{0}^{\pi}\sqrt{\left(x\sin^2\theta\cos^2\phi+y\sin^2\theta\sin^2\phi +
z\cos^2\theta\right)}\sin\theta d\theta \phi\$\$

**Elliptic Integrals of the First Kind - Legendre Form**

- `ellint_1(k, phi)`: Incomplete elliptic integral of the first kind:
  \\F(\phi, k)\\:

\$\$F(\phi, k) =
\int_0^{\phi}\frac{d\theta}{\sqrt{1-k^2\sin^2\theta}}d\theta\$\$

**Elliptic Integrals of the Second Kind - Legendre Form**

- `ellint_2(k, phi)`: Incomplete elliptic integral of the second kind:
  \\E(\phi, k)\\:

\$\$E(\phi, k) = \int_0^{\phi}\sqrt{1-k^2\sin^2\theta}d\theta\$\$

**Elliptic Integrals of the Third Kind - Legendre Form**

- `ellint_3(k, n, phi)`: Incomplete elliptic integral of the third kind:
  \\\Pi(n, \phi, k)\\:

\$\$\Pi(n, \phi, k) =
\int_0^{\phi}\frac{d\theta}{\left(1-n\sin^2\theta\right)\sqrt{1-k^2\sin^2\theta}}d\theta\$\$

**Elliptic Integral D - Legendre Form**

- `ellint_d(k, phi)`: Incomplete elliptic integral \\D(\phi, k)\\:

\$\$D(\phi, k) = \frac{(F(\phi, k) - E(\phi, k))}{k^2}\$\$

**Jacobi Zeta Function**

- `jacobi_zeta(k, phi)`: Jacobi Zeta function \\Z(\phi, k)\\:

\$\$Z(\phi, k) = E(\phi, k) -
\frac{E(\frac{\pi}{2},k)F(\phi,k)}{F(\frac{\pi}{2}, k)}\$\$

**Heuman Lambda Function**

- `heuman_lambda(k, phi)`: Heuman Lambda function \\\Lambda_0(\phi,
  k)\\:

\$\$\Lambda_0(\phi, k) = \frac{F(\phi,\sqrt{1-k^2})}{F(\frac{\pi}{2},
\sqrt{1-k^2})} + \frac{2}{\pi}F(\frac{\pi}{2},k)Z(\phi,
\sqrt{1-k^2})\$\$

## Usage

``` r
ellint_rf(x, y, z)

ellint_rd(x, y, z)

ellint_rj(x, y, z, p)

ellint_rc(x, y)

ellint_rg(x, y, z)

ellint_1(k, phi = NULL)

ellint_2(k, phi = NULL)

ellint_3(k, n, phi = NULL)

ellint_d(k, phi = NULL)

jacobi_zeta(k, phi)

heuman_lambda(k, phi)
```

## Arguments

- x:

  First parameter of Carlson's integral (must be non-negative)

- y:

  Second parameter of Carlson's integral

- z:

  Third parameter of Carlson's integral

- p:

  Fourth parameter of the integral (for Rj, must be non-zero)

- k:

  Elliptic modulus for Legendre-form integrals

- phi:

  Amplitude (angle) for incomplete elliptic integrals

- n:

  Characteristic for elliptic integrals of the third kind

## Value

A single numeric value with the computed elliptic integral.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/ellint.html)
for more details on the mathematical background.

## Examples

``` r
# Carlson's elliptic integral Rf with parameters x = 1, y = 2, z = 3
ellint_rf(1, 2, 3)
#> [1] 0.7269459
# Carlson's elliptic integral Rd with parameters x = 1, y = 2, z = 3
ellint_rd(1, 2, 3)
#> [1] 0.2904603
# Carlson's elliptic integral Rj with parameters x = 1, y = 2, z = 3, p = 4
ellint_rj(1, 2, 3, 4)
#> [1] 0.2398481
# Carlson's elliptic integral Rc with parameters x = 1, y = 2
ellint_rc(1, 2)
#> [1] 0.7853982
# Carlson's elliptic integral Rg with parameters x = 1, y = 2, z = 3
ellint_rg(1, 2, 3)
#> [1] 1.401847
# Incomplete elliptic integral of the first kind with k = 0.5, phi = pi/4
ellint_1(0.5, pi / 4)
#> [1] 0.8043661
# Complete elliptic integral of the first kind
ellint_1(0.5)
#> [1] 1.68575
# Incomplete elliptic integral of the second kind with k = 0.5, phi = pi/4
ellint_2(0.5, pi / 4)
#> [1] 0.767196
# Complete elliptic integral of the second kind
ellint_2(0.5)
#> [1] 1.467462
# Incomplete elliptic integral of the third kind with k = 0.5, n = 0.5, phi = pi/4
ellint_3(0.5, 0.5, pi / 4)
#> [1] 0.8930657
# Complete elliptic integral of the third kind with k = 0.5, n = 0.5
ellint_3(0.5, 0.5)
#> [1] 2.413672
# Incomplete elliptic integral D with k = 0.5, phi = pi/4
ellint_d(0.5, pi / 4)
#> [1] 0.1486805
# Complete elliptic integral D
ellint_d(0.5)
#> [1] 0.8731526
# Jacobi zeta function with k = 0.5, phi = pi/4
jacobi_zeta(0.5, pi / 4)
#> [1] 0.06698741
# Heuman's lambda function with k = 0.5, phi = pi/4
heuman_lambda(0.5, pi / 4)
#> [1] 0.6632254
```
