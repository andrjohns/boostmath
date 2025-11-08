# Boost Math - Filters

## Filters

The
[Filters](https://www.boost.org/doc/libs/latest/libs/math/doc/html/filters.html)
section of the Boost Math library cover a broad range of areas

### [Daubechies Filters](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/daubechies_filters.html)

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
