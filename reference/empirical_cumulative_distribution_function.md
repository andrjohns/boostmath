# Empirical Cumulative Distribution Function (ECDF)

Create an empirical cumulative distribution function (ECDF) from a given
vector.

## Usage

``` r
empirical_cumulative_distribution_function(data, sorted = FALSE)
```

## Arguments

- data:

  A numeric vector of data points.

- sorted:

  A logical indicating whether the data is already sorted. Default is
  FALSE.

## Value

An object representing the ECDF, with member function `$ecdf(x)` to
evaluate the ECDF at point(s) `x`.

## Details

The ECDF is a step function constructed from observed data that
converges to the true CDF as sample size grows. It is commonly used in
goodness-of-fit workflows that compare the empirical CDF to a
hypothesised distribution.

**Implementation Notes:** Data must be sorted; by default the
constructor sorts at \$\$O(n \log n)\$\$ cost. If the data is already
sorted, set `sorted = TRUE` to avoid the sort. Evaluation uses binary
search (`upper_bound`) and runs in \$\$O(\log n)\$\$ time.

## Examples

``` r
data <- c(1.2, 2.3, 3.1, 4.5, 5.0)
ecdf_obj <- empirical_cumulative_distribution_function(data)
ecdf_obj$ecdf(3.0)  # Evaluate ECDF at x = 3.0
#> [1] 0.4
```
