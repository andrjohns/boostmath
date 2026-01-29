# Runs Tests

The runs test is a statistical test that checks a randomness hypothesis
for a two-valued data sequence. It can be used to test the hypothesis
that the elements of the sequence are mutually independent.

**Runs Above and Below Median:** Determines if a sequence is random by
observing the number of consecutive values which exceed (or are below)
the median of the sequence. Values equal to the median are ignored. The
expected number of runs and variance are calculated according to NIST
standards to derive a test statistic and p-value. This function
calculates the median internally.

**Runs Above and Below Threshold:** similar to the median test, but uses
a user-specified `threshold` instead of the calculated median. This is
more efficient if the median is already known or if a different
threshold is required.

## Usage

``` r
runs_above_and_below_threshold(v, threshold)

runs_above_and_below_median(v)
```

## Arguments

- v:

  A numeric vector containing the sequence to test.

- threshold:

  A single numeric value to serve as the threshold for the test (for
  `runs_above_and_below_threshold`).

## Value

A two-element numeric vector:

- The first element is the **t-statistic**.

- The second element is the **p-value** (two-sided).

## Details

The test statistic is approximated as a standard normal distribution to
extract the p-value. If the p-value is small (e.g., \< 0.05), the null
hypothesis of randomness is rejected.

## References

NIST/SEMATECH e-Handbook of Statistical Methods, "Runs Test for
Detecting Non-randomness",
<https://www.itl.nist.gov/div898/handbook/eda/section3/eda35d.htm>

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/runs_test.html)

## Examples

``` r
# Runs Above and Below Threshold with a known threshold
v <- c(1, 2, 3, 4, 5, 1, 2, 3, 4, 5)
runs_above_and_below_threshold(v, threshold = 3)
#> [1] -0.7637626  0.4450087

# Runs Above and Below Median (calculates median = 3 internally)
runs_above_and_below_median(v)
#> [1] -0.7637626  0.4450087

# Example of a non-random sequence (fewer runs than expected)
v_non_random <- c(rep(1, 5), rep(10, 5))
runs_above_and_below_median(v_non_random)
#> [1] -2.683281573  0.007290358
```
