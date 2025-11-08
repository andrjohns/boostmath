# Filters

Functions to compute Daubechies wavelet and scaling filters.

## Usage

``` r
daubechies_scaling_filter(order)

daubechies_wavelet_filter(order)
```

## Arguments

- order:

  An integer specifying the order of the Daubechies filter (must be
  between 1 and 19).

## Value

A numeric vector of size 2\*order containing the filter coefficients.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/daubechies_filters.html)
for more details on the mathematical background.

## Examples

``` r
# Daubechies Scaling Filter of order 4
daubechies_scaling_filter(4)
#> [1]  0.23037781  0.71484657  0.63088077 -0.02798377 -0.18703481  0.03084138
#> [7]  0.03288301 -0.01059740
# Daubechies Wavelet Filter of order 4
daubechies_wavelet_filter(4)
#> [1] -0.01059740 -0.03288301  0.03084138  0.18703481 -0.02798377 -0.63088077
#> [7]  0.71484657 -0.23037781
```
