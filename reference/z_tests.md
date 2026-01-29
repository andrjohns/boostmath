# Z-Tests

Statistical hypothesis tests for population means using the Normal (Z)
distribution.

Z-tests are typically used when:

1.  The population variance is known.

2.  The sample size is large (N \> 30), allowing the sample variance to
    approximate the population variance (via Central Limit Theorem).

**One-Sample Tests:**

- `one_sample_z_test`: Performs a Z-test on a data vector `u` against an
  `assumed_mean`.

- `one_sample_z_test_params`: Performs a Z-test given summary statistics
  (mean, variance, N).

**Two-Sample Tests:**

- `two_sample_z_test`: Performs a Z-test comparing the means of two data
  vectors `u` and `v`.

## Usage

``` r
one_sample_z_test_params(
  sample_mean,
  sample_variance,
  num_samples,
  assumed_mean
)

one_sample_z_test(u, assumed_mean)

two_sample_z_test(u, v)
```

## Arguments

- sample_mean:

  Numeric. The mean of the sample.

- sample_variance:

  Numeric. The variance of the sample.

- num_samples:

  Integer. The size of the sample.

- assumed_mean:

  Numeric. The null hypothesis mean value to test against.

- u:

  A numeric vector containing the first sample.

- v:

  A numeric vector containing the second sample (for two-sample test).

## Value

A numeric vector containing:

1.  **Statistic:** The computed Z-statistic.

2.  **P-Value:** The two-sided p-value associated with the Z-statistic.

## Details

- **Statistic:** The Z-statistic is calculated as \$\$Z =
  \frac{\bar{x} - \mu}{\sigma / \sqrt{n}}\$\$.

- **Assumptions:** The underlying distribution is Normal, or the sample
  size is large enough for the CLT to apply.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/z_test.html)

## Examples

``` r
# --- One-Sample Z-Test ---
data1 <- c(5, 6, 7, 5, 6, 8)
# Test if population mean is 4
one_sample_z_test(data1, assumed_mean = 4)
#> [1] 4.539796923 0.006169843

# Using Summary Statistics
# Mean = 2, Variance = 1, N = 30, Null Mean = 0
one_sample_z_test_params(sample_mean = 2,
                         sample_variance = 1,
                         num_samples = 30,
                         assumed_mean = 0)
#> [1] 1.095445e+01 8.021287e-12

# --- Two-Sample Z-Test ---
data2 <- c(4, 5, 6, 4, 5, 7)
# Test if data1 and data2 have different means
two_sample_z_test(data1, data2)
#> [1] 1.4815944 0.1692572
```
