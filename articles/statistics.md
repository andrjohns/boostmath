# Boost Math - Statistics

## Statistics

The
[Statistics](https://www.boost.org/doc/libs/latest/libs/math/doc/html/statistics.html)
section of the Boost Math library cover a broad range of areas

### [Univariate Statistics](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/univariate_statistics.html)

``` r
# Mean
mean_boost(c(1, 2, 3, 4, 5))
#> [1] 3
# Variance
variance(c(1, 2, 3, 4, 5))
#> [1] 2
# Sample Variance
sample_variance(c(1, 2, 3, 4, 5))
#> [1] 2.5
# Mean and Sample Variance
mean_and_sample_variance(c(1, 2, 3, 4, 5))
#> [1] 3.0 2.5
# Skewness
skewness(c(1, 2, 3, 4, 5))
#> [1] 0
# Kurtosis
kurtosis(c(1, 2, 3, 4, 5))
#> [1] 1.7
# Excess Kurtosis
excess_kurtosis(c(1, 2, 3, 4, 5))
#> [1] -1.3
# First Four Moments
first_four_moments(c(1, 2, 3, 4, 5))
#> [1] 3.0 2.0 0.0 6.8
# Median
median_boost(c(1, 2, 3, 4, 5))
#> [1] 3
# Median Absolute Deviation
median_absolute_deviation(c(1, 2, 3, 4, 5))
#> [1] 1
# Interquartile Range
interquartile_range(c(1, 2, 3, 4, 5))
#> [1] 3
# Gini Coefficient
gini_coefficient(c(1, 2, 3, 4, 5))
#> [1] 0.2666667
# Sample Gini Coefficient
sample_gini_coefficient(c(1, 2, 3, 4, 5))
#> [1] 0.3333333
# Mode
mode(c(1, 2, 2, 3, 4))
#> [1] 2
```

### [Bivariate Statistics](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/bivariate_statistics.html)

``` r
# Covariance
covariance(c(1, 2, 3), c(4, 5, 6))
#> [1] 0.6666667
# Means and Covariance
means_and_covariance(c(1, 2, 3), c(4, 5, 6))
#> [1] 2.0000000 5.0000000 0.6666667
# Correlation Coefficient
correlation_coefficient(c(1, 2, 3), c(4, 5, 6))
#> [1] 1
```

### [Signal Statistics](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/signal_statistics.html)

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

noisy_signal <- c(1.1, 2.1, 3.1)
# Oracle SNR
oracle_snr(c(1, 2, 3), c(1.1, 2.1, 3.1))
#> [1] 466.6667
# Oracle SNR in dB
oracle_snr_db(c(1, 2, 3), c(1.1, 2.1, 3.1))
#> [1] 26.69007
# M2M4 SNR Estimator in dB
m2m4_snr_estimator(c(1.1, 2.1, 3.1), 3, 2)
#> [1] NaN
# M2M4 SNR Estimator in dB
m2m4_snr_estimator_db(c(1.1, 2.1, 3.1), 3, 2)
#> [1] NaN
```

### [Anderson-Darling Test](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/anderson_darling.html)

``` r
# Anderson-Darling test for normality
anderson_darling_normality_statistic(c(1, 2, 3, 4, 5), 0, 1)
#> [1] 19.49684
```

### [T-Tests](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/t_test.html)

``` r
# One Sample T-Test with parameters
one_sample_t_test_params(sample_mean = 2, sample_variance = 1, num_samples = 30, assumed_mean = 0)
#> [1] 1.095445e+01 8.021287e-12
# One Sample T-Test
one_sample_t_test(c(1, 2, 3, 4, 5), assumed_mean = 0)
#> [1] 4.2426407 0.0132356
# Two Sample T-Test
two_sample_t_test(c(1, 2, 3), c(4, 5, 6))
#> [1] -3.67423461  0.02131164
# Paired Samples T-Test
paired_samples_t_test(c(1, 2, 3), c(4, 5, 6))
#> [1] -Inf    0
```

### [Z-Tests](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/z_test.html)

``` r
# One Sample Z-Test with parameters
one_sample_z_test_params(sample_mean = 2, sample_variance = 1, num_samples = 30, assumed_mean = 0)
#> [1] 1.095445e+01 8.021287e-12
# One Sample Z-Test
one_sample_z_test(c(1, 2, 3, 4, 5), assumed_mean = 0)
#> [1] 4.2426407 0.0132356
# Two Sample ZTest
two_sample_z_test(c(1, 2, 3), c(4, 5, 6))
#> [1] -3.67423461  0.02131164
```

### [Runs Tests](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/runs_test.html)

``` r
# Runs Above and Below Threshold
runs_above_and_below_threshold(c(1, 2, 3, 4, 5), threshold = 3)
#> [1] -1.2247449  0.2206714
#' # Runs Above and Below Median
runs_above_and_below_median(c(1, 2, 3, 4, 5))
#> [1] -1.2247449  0.2206714
```

### [Ljung-Box Tests](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/ljung_box.html)

``` r
# Ljung-Box test for autocorrelation
ljung_box(c(1, 2, 3, 4, 5), lags = 2, fit_dof = 0)
#> [1] 1.5166667 0.4684465
```

### [Linear Regression](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/linear_regression.html)

``` r
x <- c(1, 2, 3, 4, 5)
y <- c(2, 3, 5, 7, 11)
# Simple Ordinary Least Squares
simple_ordinary_least_squares(x, y)
#> [1] -1.0  2.2
# Simple Ordinary Least Squares with R-squared
simple_ordinary_least_squares_with_R_squared(x, y)
#> [1] -1.0000000  2.2000000  0.9453125
```
