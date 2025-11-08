# Signal Statistics Functions

Functions to compute various signal statistics.

## Usage

``` r
absolute_gini_coefficient(x)

sample_absolute_gini_coefficient(x)

hoyer_sparsity(x)

oracle_snr(signal, noisy_signal)

oracle_snr_db(signal, noisy_signal)

m2m4_snr_estimator(noisy_signal, signal_kurtosis = 1, noise_kurtosis = 3)

m2m4_snr_estimator_db(noisy_signal, signal_kurtosis = 1, noise_kurtosis = 3)
```

## Arguments

- x:

  A numeric vector.

- signal:

  A numeric vector.

- noisy_signal:

  A numeric vector.

- signal_kurtosis:

  A single numeric value.

- noise_kurtosis:

  A single numeric value.

## Value

A numeric value or vector with the computed statistic.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/signal_statistics.html)
for more details on the mathematical background.

## Examples

``` r
# Absolute Gini Coefficient
absolute_gini_coefficient(c(1, 2, 3, 4, 5))
#> [1] 0.2666667
# Sample Absolute Gini Coefficient
sample_absolute_gini_coefficient(c(1, 2, 3, 4, 5))
#> [1] 0.3333333
# Hoyer Sparsity
hoyer_sparsity(c(1, 0, 0, 2, 3))
#> [1] 0.5117037

signal <- c(1, 2, 3)
noisy_signal <- c(1.1, 2.1, 3.1)
# Oracle SNR
oracle_snr(signal, noisy_signal)
#> [1] 466.6667
# Oracle SNR in dB
oracle_snr_db(signal, noisy_signal)
#> [1] 26.69007
# M2M4 SNR Estimator
m2m4_snr_estimator(noisy_signal, 3, 2)
#> [1] NaN
# M2M4 SNR Estimator in dB
m2m4_snr_estimator_db(noisy_signal, 3, 2)
#> [1] NaN
```
