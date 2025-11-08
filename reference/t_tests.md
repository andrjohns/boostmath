# T-Tests

Functions for T - Tests.

## Usage

``` r
one_sample_t_test_params(
  sample_mean,
  sample_variance,
  num_samples,
  assumed_mean
)

one_sample_t_test(u, assumed_mean)

two_sample_t_test(u, v)

paired_samples_t_test(u, v)
```

## Arguments

- sample_mean:

  A single value.

- sample_variance:

  A single value.

- num_samples:

  A single value.

- assumed_mean:

  A single value.

- u:

  A numeric vector.

- v:

  A numeric vector.

## Value

A two-element numeric vector containing the t-statistic and the p-value.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/t_test.html)
for more details on the mathematical background.

## Examples

``` r
# One Sample T-Test Parameters
one_sample_t_test_params(sample_mean = 2, sample_variance = 1, num_samples = 30, assumed_mean = 0)
#> [1] 1.095445e+01 8.021287e-12
# One Sample T-Test
one_sample_t_test(c(5, 6, 7), assumed_mean = 4)
#> [1] 3.4641016 0.0741799
# Two Sample T-Test
two_sample_t_test(c(5, 6, 7), c(4, 5, 6))
#> [1] 1.2247449 0.2878641
# Paired Samples T-Test
paired_samples_t_test(c(5, 6, 7), c(4, 5, 6))
#> [1] Inf   0
```
