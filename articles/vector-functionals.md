# Boost Math - Vector Functionals

## [Vector Functionals - Norms](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/norms.html)

``` r
# L0 Pseudo Norm
l0_pseudo_norm(c(1, 0, 2, 0, 3))
#> [1] 3
# Hamming Distance
hamming_distance(c(1, 0, 1), c(0, 1, 1))
#> [1] 2
# L1 Norm
l1_norm(c(1, -2, 3))
#> [1] 6
# L1 Distance
l1_distance(c(1, -2, 3), c(4, -5, 6))
#> [1] 9
# L2 Norm
l2_norm(c(3, 4))
#> [1] 5
# L2 Distance
l2_distance(c(3, 4), c(0, 0))
#> [1] 5
# Supremum Norm
sup_norm(c(1, -2, 3))
#> [1] 3
# Supremum Distance
sup_distance(c(1, -2, 3), c(4, -5, 6))
#> [1] 3
# Lp Norm
lp_norm(c(1, -2, 3), 3)
#> [1] 3.301927
# Lp Distance
lp_distance(c(1, -2, 3), c(4, -5, 6), 3)
#> [1] 4.326749
# Total Variation
total_variation(c(1, 2, 1, 3))
#> [1] 4
```
