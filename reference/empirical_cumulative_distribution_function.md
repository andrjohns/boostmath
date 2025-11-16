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

An object representing the ECDF, with member function `value(x)` to
evaluate the ECDF at point(s) `x`.

## Examples

``` r
data <- c(1.2, 2.3, 3.1, 4.5, 5.0)
ecdf_obj <- empirical_cumulative_distribution_function(data)
ecdf_obj$value(3.0)  # Evaluate ECDF at x = 3.0
#> [1] 0.4
```
