# Boost Math - Special Functions

## Special Math Functions

The [Special
Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/special.html)
section of the Boost Math library cover a broad range of areas

### [Number Series](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/number_series.html)

``` r
bernoulli_b2n(10)
#> [1] -529.1242
max_bernoulli_b2n()
#> [1] 129
unchecked_bernoulli_b2n(10)
#> [1] -529.1242
bernoulli_b2n(start_index = 0, number_of_bernoullis_b2n = 10)
#>  [1]  1.00000000  0.16666667 -0.03333333  0.02380952 -0.03333333  0.07575758
#>  [7] -0.25311355  1.16666667 -7.09215686 54.97117794
tangent_t2n(10)
#> [1] 2.908889e+13
tangent_t2n(start_index = 0, number_of_tangent_t2n = 10)
#>  [1]            0            1            2           16          272
#>  [6]         7936       353792     22368256   1903757312 209865342976
prime(10)
#> [1] 31
max_prime()
#> [1] 9999
fibonacci(10)
#> [1] 55
unchecked_fibonacci(10)
#> [1] 55
```

### [Gamma Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_gamma.html)

``` r
# Gamma function for z = 5
tgamma(5)
#> [1] 24
# Gamma function for (1 + z) - 1, where z = 5
tgamma1pm1(5)
#> [1] 119
# Logarithm of the gamma function for z = 5
lgamma_boost(5)
#> [1] 3.178054
# Digamma function for z = 5
digamma_boost(5)
#> [1] 1.506118
# Trigamma function for z = 5
trigamma_boost(5)
#> [1] 0.221323
# Polygamma function of order 1 for z = 5
polygamma(1, 5)
#> [1] 0.221323
# Ratio of gamma functions for a = 5, b = 3
tgamma_ratio(5, 3)
#> [1] 12
# Ratio of gamma functions with delta for a = 5, delta = 2
tgamma_delta_ratio(5, 2)
#> [1] 0.03333333
# Normalised lower incomplete gamma function P(a, z) for a = 5, z = 2
gamma_p(5, 2)
#> [1] 0.05265302
# Normalised upper incomplete gamma function Q(a, z) for a = 5, z = 2
gamma_q(5, 2)
#> [1] 0.947347
# Full lower incomplete gamma function for a = 5, z = 2
tgamma_lower(5, 2)
#> [1] 1.263672
# Full upper incomplete gamma function for a = 5, z = 2
tgamma_upper(5, 2)
#> [1] 22.73633
# Inverse of the normalised upper incomplete gamma function for a = 5, q = 0.5
gamma_q_inv(5, 0.5)
#> [1] 4.670909
# Inverse of the normalised lower incomplete gamma function for a = 5, p = 0.5
gamma_p_inv(5, 0.5)
#> [1] 4.670909
# Inverse of the normalised upper incomplete gamma function with respect to a for z = 2, q = 0.5
gamma_q_inva(2, 0.5)
#> [1] 2.323489
# Inverse of the normalised lower incomplete gamma function with respect to a for z = 2, p = 0.5
gamma_p_inva(2, 0.5)
#> [1] 2.323489
# Derivative of the normalised upper incomplete gamma function for a = 5, z = 2
gamma_p_derivative(5, 2)
#> [1] 0.09022352
```

### [Factorials and Binomial Coefficients](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/factorials.html)

``` r
# Factorial of 5
factorial_boost(5)
#> [1] 120
# Unchecked factorial of 5 (using table lookup)
unchecked_factorial(5)
#> [1] 120
# Maximum factorial value that can be computed
max_factorial()
#> [1] 170
# Double factorial of 6
double_factorial(6)
#> [1] 48
# Rising factorial of 3 with exponent 2
rising_factorial(3, 2)
#> [1] 12
# Falling factorial of 3 with exponent 2
falling_factorial(3, 2)
#> [1] 6
# Binomial coefficient "5 choose 2"
binomial_coefficient(5, 2)
#> [1] 10
```

### [Beta Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_beta.html)

``` r
# Euler beta function B(2, 3)
beta_boost(2, 3)
#> [1] 0.08333333
# Normalised incomplete beta function I_x(2, 3) for x = 0.5
ibeta(2, 3, 0.5)
#> [1] 0.6875
# Normalised complement of the incomplete beta function 1 - I_x(2, 3) for x = 0.5
ibetac(2, 3, 0.5)
#> [1] 0.3125
# Full incomplete beta function B_x(2, 3) for x = 0.5
beta_boost(2, 3, 0.5)
#> [1] 0.05729167
# Full complement of the incomplete beta function 1 - B_x(2, 3) for x = 0.5
betac(2, 3, 0.5)
#> [1] 0.02604167
# Inverse of the normalised incomplete beta function I_x(2, 3) = 0.5
ibeta_inv(2, 3, 0.5)
#> [1] 0.3857276
# Inverse of the normalised complement of the incomplete beta function I_x(2, 3) = 0.5
ibetac_inv(2, 3, 0.5)
#> [1] 0.3857276
# Inverse of the normalised complement of the incomplete beta function I_x(a, b)
# with respect to a for x = 0.5 and q = 0.5
ibetac_inva(3, 0.5, 0.5)
#> [1] 3
# Inverse of the normalised incomplete beta function I_x(a, b)
# with respect to b for x = 0.5 and p = 0.5
ibeta_invb(0.8, 0.5, 0.5)
#> [1] 0.8
# Inverse of the normalised complement of the incomplete beta function I_x(a, b)
# with respect to b for x = 0.5 and q = 0.5
ibetac_invb(2, 0.5, 0.5)
#> [1] 2
# Derivative of the incomplete beta function with respect to x for a = 2, b = 3, x = 0.5
ibeta_derivative(2, 3, 0.5)
#> [1] 1.5
```

### [Error Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_erf.html)

``` r
# Error function
erf(0.5)
#> [1] 0.5204999
# Complementary error function
erfc(0.5)
#> [1] 0.4795001
# Inverse error function
erf_inv(0.5)
#> [1] 0.4769363
# Inverse complementary error function
erfc_inv(0.5)
#> [1] 0.4769363
```

### [Polynomials](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sf_poly.html)

``` r
# Legendre polynomial of the first kind P_2(0.5)
legendre_p(2, 0.5)
#> [1] -0.125
# Derivative of the Legendre polynomial of the first kind P_2'(0.5)
legendre_p_prime(2, 0.5)
#> [1] 1.5
# Zeros of the Legendre polynomial of the first kind P_2
legendre_p_zeros(2)
#> [1] 0.5773503
# Legendre polynomial of the first kind with order 1 P_2^1(0.5)
legendre_p_m(2, 1, 0.5)
#> [1] -1.299038
# Legendre polynomial of the second kind Q_2(0.5)
legendre_q(2, 0.5)
#> [1] -0.8186633
# Next Legendre polynomial of the first kind P_3(0.5) using P_2(0.5) and P_1(0.5)
legendre_next(2, 0.5, legendre_p(2, 0.5), legendre_p(1, 0.5))
#> [1] -0.4375
# Next Legendre polynomial of the first kind with order 1 P_3^1(0.5) using P_2^1(0.5) and P_1^1(0.5)
legendre_next_m(2, 1, 0.5, legendre_p_m(2, 1, 0.5), legendre_p_m(1, 1, 0.5))
#> [1] -0.3247595
# Laguerre polynomial of the first kind L_2(0.5)
laguerre(2, 0.5)
#> [1] 0.125
# Laguerre polynomial of the first kind with order 1 L_2^1(0.5)
laguerre_m(2, 1, 0.5)
#> [1] 1.625
# Next Laguerre polynomial of the first kind L_3(0.5) using L_2(0.5) and L_1(0.5)
laguerre_next(2, 0.5, laguerre(2, 0.5), laguerre(1, 0.5))
#> [1] -0.1458333
# Next Laguerre polynomial of the first kind with order 1 L_3^1(0.5) using L_2^1(0.5) and L_1^1(0.5)
laguerre_next_m(2, 1, 0.5, laguerre_m(2, 1, 0.5), laguerre_m(1, 1, 0.5))
#> [1] 1.479167
# Hermite polynomial H_2(0.5)
hermite(2, 0.5)
#> [1] -1
# Next Hermite polynomial H_3(0.5) using H_2(0.5) and H_1(0.5)
hermite_next(2, 0.5, hermite(2, 0.5), hermite(1, 0.5))
#> [1] -5
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
# Chebyshev polynomial of the first kind using Clenshaw's recurrence with coefficients
# c = c(1, 0, -1) at x = 0.5
chebyshev_clenshaw_recurrence(c(1, 0, -1), 0.5)
#> [1] 1
# Chebyshev polynomial of the first kind using Clenshaw's recurrence with interval [0, 1]
chebyshev_clenshaw_recurrence_ab(c(1, 0, -1), 0, 1, 0.5)
#> [1] 1.5
# Spherical harmonic function Y_2^1(0.5, 0.5)
spherical_harmonic(2, 1, 0.5, 0.5)
#> [1] -0.2852481-0.1558318i
# Real part of the spherical harmonic function Y_2^1(0.5, 0.5)
spherical_harmonic_r(2, 1, 0.5, 0.5)
#> [1] -0.2852481
# Imaginary part of the spherical harmonic function Y_2^1(0.5, 0.5)
spherical_harmonic_i(2, 1, 0.5, 0.5)
#> [1] -0.1558318
# Gegenbauer polynomial C_2^(1)(0.5)
gegenbauer(2, 1, 0.5)
#> [1] 0
# Derivative of the Gegenbauer polynomial C_2^(1)'(0.5)
gegenbauer_prime(2, 1, 0.5)
#> [1] 4
# k-th derivative of the Gegenbauer polynomial C_2^(1)''(0.5)
gegenbauer_derivative(2, 1, 0.5, 2)
#> [1] 8
# Jacobi polynomial P_2^(1, 2)(0.5)
jacobi(2, 1, 2, 0.5)
#> [1] -0.1875
# Derivative of the Jacobi polynomial P_2^(1, 2)'(0.5)
jacobi_prime(2, 1, 2, 0.5)
#> [1] 3.75
# Second derivative of the Jacobi polynomial P_2^(1, 2)''(0.5)
jacobi_double_prime(2, 1, 2, 0.5)
#> [1] 10.5
# 3rd derivative of the Jacobi polynomial P_2^(1, 2)^(k)(0.5)
jacobi_derivative(2, 1, 2, 0.5, 3)
#> [1] 0
```

### [Bessel Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bessel.html)

``` r
# Bessel function of the first kind J_0(1)
cyl_bessel_j(0, 1)
#> [1] 0.7651977
# Bessel function of the second kind Y_0(1)
cyl_neumann(0, 1)
#> [1] 0.08825696
# Modified Bessel function of the first kind I_0(1)
cyl_bessel_i(0, 1)
#> [1] 1.266066
# Modified Bessel function of the second kind K_0(1)
cyl_bessel_k(0, 1)
#> [1] 0.4210244
# Spherical Bessel function of the first kind j_0(1)
sph_bessel(0, 1)
#> [1] 0.841471
# Spherical Bessel function of the second kind y_0(1)
sph_neumann(0, 1)
#> [1] -0.5403023
# Derivative of the Bessel function of the first kind J_0(1)
cyl_bessel_j_prime(0, 1)
#> [1] -0.4400506
# Derivative of the Bessel function of the second kind Y_0(1)
cyl_neumann_prime(0, 1)
#> [1] 0.7812128
# Derivative of the modified Bessel function of the first kind I_0(1)
cyl_bessel_i_prime(0, 1)
#> [1] 0.5651591
# Derivative of the modified Bessel function of the second kind K_0(1)
cyl_bessel_k_prime(0, 1)
#> [1] -0.6019072
# Derivative of the spherical Bessel function of the first kind j_0(1)
sph_bessel_prime(0, 1)
#> [1] -0.3011687
# Derivative of the spherical Bessel function of the second kind y_0(1)
sph_neumann_prime(0, 1)
#> [1] 1.381773
# Finding the first zero of the Bessel function of the first kind J_0
cyl_bessel_j_zero(0, 1)
#> [1] 2.404826
# Finding the first zero of the Bessel function of the second kind Y_0
cyl_neumann_zero(0, 1)
#> [1] 0.893577
# Finding multiple zeros of the Bessel function of the first kind J_0 starting from index 1
cyl_bessel_j_zero(0, start_index = 1, number_of_zeros = 5)
#> [1]  2.404826  5.520078  8.653728 11.791534 14.930918
# Finding multiple zeros of the Bessel function of the second kind Y_0 starting from index 1
cyl_neumann_zero(0, start_index = 1, number_of_zeros = 5)
#> [1]  0.893577  3.957678  7.086051 10.222345 13.361097
```

### [Hankel Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/hankel.html)

``` r
cyl_hankel_1(2, 0.5)
#> [1] 0.03060402-5.441371i
cyl_hankel_2(2, 0.5)
#> [1] 0.03060402+5.441371i
sph_hankel_1(2, 0.5)
#> [1] 0.01637111-25.05992i
sph_hankel_2(2, 0.5)
#> [1] 0.01637111+25.05992i
```

### [Airy Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/airy.html)

``` r
airy_ai(2)
#> [1] 0.03492413
airy_bi(2)
#> [1] 3.298095
airy_ai_prime(2)
#> [1] -0.05309038
airy_bi_prime(2)
#> [1] 4.100682
airy_ai_zero(1)
#> [1] -2.338107
airy_bi_zero(1)
#> [1] -1.173713
airy_ai_zero(start_index = 1, number_of_zeros = 5)
#> [1] -2.338107 -4.087949 -5.520560 -6.786708 -7.944134
airy_bi_zero(start_index = 1, number_of_zeros = 5)
#> [1] -1.173713 -3.271093 -4.830738 -6.169852 -7.376762
```

### [Elliptic Integrals](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/ellint.html)

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

### [Jacobi Elliptic Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/jacobi.html)

``` r
# Jacobi Elliptic Functions
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

### [Jacobi Theta Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/jacobi_theta.html)

``` r
# Jacobi Theta Functions
x <- 0.5
q <- 0.9
tau <- 1.5
jacobi_theta1(x, q)
#> [1] 0.0001025529
jacobi_theta1tau(x, tau)
#> [1] 0.2951461
jacobi_theta2(x, q)
#> [1] 0.5090257
jacobi_theta2tau(x, tau)
#> [1] 0.5403556
jacobi_theta3(x, q)
#> [1] 0.5090257
jacobi_theta3tau(x, tau)
#> [1] 1.009707
jacobi_theta3m1(x, q)
#> [1] -0.4909743
jacobi_theta3m1tau(x, tau)
#> [1] 0.00970738
jacobi_theta4(x, q)
#> [1] 0.0001025529
jacobi_theta4tau(x, tau)
#> [1] 0.9902926
jacobi_theta4m1(x, q)
#> [1] -0.9998974
jacobi_theta4m1tau(x, tau)
#> [1] -0.009707391
```

### [Lambert W Function](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/lambert_w.html)

``` r
# Lambert W Function (Principal Branch)
lambert_w0(0.3)
#> [1] 0.2367553
# Lambert W Function (Branch -1)
lambert_wm1(-0.3)
#> [1] -1.781337
# Derivative of the Lambert W Function (Principal Branch)
lambert_w0_prime(0.3)
#> [1] 0.6381087
# Derivative of the Lambert W Function (Branch -1)
lambert_wm1_prime(-0.3)
#> [1] -7.599525
```

### [Zeta Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/zetas.html)

``` r
# Riemann Zeta Function
zeta(2)  # Should return pi^2 / 6
#> [1] 1.644934
```

### [Exponential Integrals](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/expint.html)

``` r
# Exponential integral En with n = 1 and z = 2
expint_en(1, 2)
#> [1] 0.04890051
# Exponential integral Ei with z = 2
expint_ei(2)
#> [1] 4.954234
```

### [Hypergeometric Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/hypergeometric.html)

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
# Hypergeometric Function 1F1
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
# Hypergeometric Function pFq
hypergeometric_pFq(c(2, 3), c(4, 5), 6)
#> [1] 11.32427
```

### [Basic Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/powers.html)

``` r
# sin(pi * 0.5)
sin_pi(0.5)
#> [1] 1
# cos(pi * 0.5)
cos_pi(0.5)
#> [1] 0
# log(1 + 0.5)
log1p_boost(0.5)
#> [1] 0.4054651
# exp(0.5) - 1
expm1_boost(0.5)
#> [1] 0.6487213
cbrt(8)
#> [1] 2
# sqrt(1 + 0.5) - 1
sqrt1pm1(0.5)
#> [1] 0.2247449
# 2^3 - 1
powm1(2, 3)
#> [1] 7
hypot(3, 4)
#> [1] 5
rsqrt(4)
#> [1] 0.5
```

### [Sinus Cardinal and Hyperbolic Sinus Cardinal Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/sinc.html)

``` r
# Sinus cardinal function
sinc_pi(0.5)
#> [1] 0.9588511
# Hyperbolic sinus cardinal function
sinhc_pi(0.5)
#> [1] 1.042191
```

### [Inverse Hyperbolic Functions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/inv_hyper.html)

``` r
# Inverse Hyperbolic Cosine
acosh_boost(2)
#> [1] 1.316958
# Inverse Hyperbolic Sine
asinh_boost(1)
#> [1] 0.8813736
# Inverse Hyperbolic Tangent
atanh_boost(0.5)
#> [1] 0.5493061
```

### [Owen’s T Function](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/owens_t.html)

``` r
# Owens T Function
owens_t(1, 0.5)
#> [1] 0.04306469
```
