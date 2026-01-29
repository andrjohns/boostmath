# Boost Math Constants

Provides access to mathematical constants used in the Boost Math
library.

The available constants include rational fractions, \$\$\pi\$\$-related
values, \$\$e\$\$-related values, and assorted special constants (e.g.,
Euler-Mascheroni, Catalan). Integer values are intentionally omitted
since they can be constructed exactly from literals.

**Accuracy and Implementation Notes:** The constants are provided at
high precision by Boost.Math; refer to the Boost constants table for
names and values.

## Usage

``` r
constants(constant = NULL)
```

## Arguments

- constant:

  A string specifying the name of the constant to retrieve. If `NULL`,
  returns a list of all constants (see documentation for the full list).

## Value

Requested constant value if `constant` is specified, otherwise a list of
all available constants.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/constants.html)
for more details on the constants.

## Examples

``` r
constants()
#> $half
#> [1] 0.5
#> 
#> $third
#> [1] 0.3333333
#> 
#> $twothirds
#> [1] 0.6666667
#> 
#> $two_thirds
#> [1] 0.6666667
#> 
#> $sixth
#> [1] 0.1666667
#> 
#> $three_quarters
#> [1] 0.75
#> 
#> $root_two
#> [1] 1.414214
#> 
#> $root_three
#> [1] 1.732051
#> 
#> $half_root_two
#> [1] 0.7071068
#> 
#> $ln_two
#> [1] 0.6931472
#> 
#> $ln_ln_two
#> [1] -0.3665129
#> 
#> $root_ln_four
#> [1] 1.17741
#> 
#> $one_div_root_two
#> [1] 0.7071068
#> 
#> $pi
#> [1] 3.141593
#> 
#> $half_pi
#> [1] 1.570796
#> 
#> $third_pi
#> [1] 1.047198
#> 
#> $sixth_pi
#> [1] 0.5235988
#> 
#> $two_pi
#> [1] 6.283185
#> 
#> $two_thirds_pi
#> [1] 2.094395
#> 
#> $three_quarters_pi
#> [1] 2.356194
#> 
#> $four_thirds_pi
#> [1] 4.18879
#> 
#> $one_div_two_pi
#> [1] 0.1591549
#> 
#> $one_div_root_two_pi
#> [1] 0.3989423
#> 
#> $log_pi
#> [1] 1.14473
#> 
#> $root_pi
#> [1] 1.772454
#> 
#> $root_half_pi
#> [1] 1.253314
#> 
#> $root_two_pi
#> [1] 2.506628
#> 
#> $log_root_two_pi
#> [1] 0.9189385
#> 
#> $one_div_root_pi
#> [1] 0.5641896
#> 
#> $root_one_div_pi
#> [1] 0.5641896
#> 
#> $pi_minus_three
#> [1] 0.1415927
#> 
#> $four_minus_pi
#> [1] 0.8584073
#> 
#> $pi_pow_e
#> [1] 22.45916
#> 
#> $pi_sqr
#> [1] 9.869604
#> 
#> $pi_sqr_div_six
#> [1] 1.644934
#> 
#> $pi_cubed
#> [1] 31.00628
#> 
#> $cbrt_pi
#> [1] 1.464592
#> 
#> $one_div_cbrt_pi
#> [1] 0.6827841
#> 
#> $log2_e
#> [1] 1.442695
#> 
#> $e
#> [1] 2.718282
#> 
#> $exp_minus_half
#> [1] 0.6065307
#> 
#> $exp_minus_one
#> [1] 0.3678794
#> 
#> $e_pow_pi
#> [1] 23.14069
#> 
#> $root_e
#> [1] 1.648721
#> 
#> $log10_e
#> [1] 0.4342945
#> 
#> $one_div_log10_e
#> [1] 2.302585
#> 
#> $ln_ten
#> [1] 2.302585
#> 
#> $degree
#> [1] 0.01745329
#> 
#> $radian
#> [1] 57.29578
#> 
#> $sin_one
#> [1] 0.841471
#> 
#> $cos_one
#> [1] 0.5403023
#> 
#> $sinh_one
#> [1] 1.175201
#> 
#> $cosh_one
#> [1] 1.543081
#> 
#> $phi
#> [1] 1.618034
#> 
#> $ln_phi
#> [1] 0.4812118
#> 
#> $one_div_ln_phi
#> [1] 2.078087
#> 
#> $euler
#> [1] 0.5772157
#> 
#> $one_div_euler
#> [1] 1.732455
#> 
#> $euler_sqr
#> [1] 0.3331779
#> 
#> $zeta_two
#> [1] 1.644934
#> 
#> $zeta_three
#> [1] 1.202057
#> 
#> $catalan
#> [1] 0.9159656
#> 
#> $glaisher
#> [1] 1.282427
#> 
#> $khinchin
#> [1] 2.685452
#> 
#> $extreme_value_skewness
#> [1] 1.139547
#> 
#> $rayleigh_skewness
#> [1] 0.6311107
#> 
#> $rayleigh_kurtosis
#> [1] 3.245089
#> 
#> $rayleigh_kurtosis_excess
#> [1] 0.2450893
#> 
#> $two_div_pi
#> [1] 0.6366198
#> 
#> $root_two_div_pi
#> [1] 0.7978846
#> 
#> $quarter_pi
#> [1] 0.7853982
#> 
#> $one_div_pi
#> [1] 0.3183099
#> 
#> $two_div_root_pi
#> [1] 1.128379
#> 
#> $first_feigenbaum
#> [1] 4.669202
#> 
#> $plastic
#> [1] 1.324718
#> 
#> $gauss
#> [1] 0.8346268
#> 
#> $dottie
#> [1] 0.7390851
#> 
#> $reciprocal_fibonacci
#> [1] 3.359886
#> 
#> $laplace_limit
#> [1] 0.6627434
#> 
```
