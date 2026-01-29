# Univariate Statistics

Functions to compute robust univariate statistics from a dataset.

**Central Tendency:**

- `mean_boost`: Computes the arithmetic mean using Higham's numerically
  stable algorithm.

- `median_boost`: Computes the median (robust to outliers).

- `mode`: Computes the mode(s) of the dataset.

**Dispersion (Spread):**

- `variance`: Computes the population variance using Higham's algorithm.

- `sample_variance`: Computes the sample variance (unbiased estimator).

- `mean_and_sample_variance`: Efficiently computes both mean and sample
  variance in one pass.

- `median_absolute_deviation`: Computes the Median Absolute Deviation
  (MAD), a robust measure of variability.

- `interquartile_range`: Computes the Interquartile Range (IQR = Q3 -
  Q1), robust to outliers.

**Shape:**

- `skewness`: Measures the asymmetry of the distribution (Pebay's
  algorithm).

- `kurtosis`: Measures the "tailedness" of the distribution (Pebay's
  algorithm).

- `excess_kurtosis`: Kurtosis minus 3 (Normal distribution has 0 excess
  kurtosis).

- `first_four_moments`: Computes Mean, Variance, Skewness, and Kurtosis
  in a single pass.

**Inequality:**

- `gini_coefficient`: Computes the Gini coefficient (population). range
  \\\[0, 1 - 1/n\]\\.

- `sample_gini_coefficient`: Computes the sample Gini coefficient. range
  \\\[0, 1\]\\.

## Usage

``` r
mean_boost(x)

# Default S3 method
variance(x, ...)

sample_variance(x)

mean_and_sample_variance(x)

# Default S3 method
skewness(x, ...)

# Default S3 method
kurtosis(x, ...)

excess_kurtosis(x)

first_four_moments(x)

median_boost(x)

median_absolute_deviation(x)

interquartile_range(x)

gini_coefficient(x)

sample_gini_coefficient(x)

# Default S3 method
mode(x, ...)
```

## Arguments

- x:

  A numeric vector containing the dataset.

- ...:

  Additional arguments (for S3 compatibility, e.g., with defaults).

## Value

A numeric value (or vector for moments/mode) with the computed
statistic.

## Details

These functions are designed to be numerically stable and efficient.
Most implementations follow algorithms described by Higham (Accuracy and
Stability of Numerical Algorithms) or Pebay (Sandia Labs) for one-pass
parallel computation.

## References

Higham, N. J. (2002). Accuracy and stability of numerical algorithms.
SIAM. Pebay, P. P. (2008). Formulas for Robust, One-Pass Parallel
Computation of Covariances and Arbitrary-Order Statistical Moments.
Sandia Report.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/univariate_statistics.html)

## Examples

``` r
data <- c(1, 2, 3, 4, 100) # Dataset with an outlier

# --- Central Tendency ---
mean_boost(data)
#> [1] 22
median_boost(data) # Less affected by 100
#> [1] 3
mode(c(1, 2, 2, 3))
#> [1] 2

# --- Dispersion ---
variance(data)
#> [1] 1522
sample_variance(data)
#> [1] 1902.5
median_absolute_deviation(data) # Robust
#> [1] 1
interquartile_range(data)       # Robust
#> [1] 50.5

# --- Shape ---
skewness(data)
#> [1] 1.497537
excess_kurtosis(data)
#> [1] 0.2467165
first_four_moments(data)
#> [1]      22    1522   88920 7520967

# --- Inequality ---
gini_coefficient(c(1, 0, 0, 0)) # High inequality
#> [1] 0.75
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
