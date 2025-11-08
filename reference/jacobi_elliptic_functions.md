# Jacobi Elliptic Functions

Functions to compute the Jacobi elliptic functions: sn, cn, dn, and
others.

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

  Elliptic modulus (0 \<= k \< 1)

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
