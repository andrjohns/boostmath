# Boost Math - Statistical Distributions

## Statistics

The [Statistical
Distributions](https://www.boost.org/doc/libs/latest/libs/math/doc/html/dist.html)
section of the Boost Math library cover a broad range of areas

### [Arcsine Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/arcine_dist.html)

``` r
# Arcsine distribution with default parameters
dist <- arcsine_distribution()
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5
logcdf(dist, 0.5)
#> [1] -0.6931472
pdf(dist, 0.5)
#> [1] 0.6366198
logpdf(dist, 0.5)
#> [1] -0.4515827
hazard(dist, 0.5)
#> [1] 1.27324
chf(dist, 0.5)
#> [1] 0.6931472
mean(dist)
#> [1] 0.5
median(dist)
#> [1] 0.5
range(dist)
#> [1] 0 1
quantile(dist, 0.2)
#> [1] 0.0954915
standard_deviation(dist)
#> [1] 0.3535534
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.125
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 1.5
kurtosis_excess(dist)
#> [1] -1.5

# Convenience functions
arcsine_pdf(0.5)
#> [1] 0.6366198
arcsine_lpdf(0.5)
#> [1] -0.4515827
arcsine_cdf(0.5)
#> [1] 0.5
arcsine_lcdf(0.5)
#> [1] -0.6931472
arcsine_quantile(0.5)
#> [1] 0.5
```

### [Bernoulli Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/bernoulli_dist.html)

``` r
# Bernoulli distribution with p_success = 0.5
dist <- bernoulli_distribution(0.5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.8183099
logcdf(dist, 0.5)
#> [1] -0.2005142
pdf(dist, 0.5)
#> [1] 0.6366198
logpdf(dist, 0.5)
#> [1] -0.4515827
hazard(dist, 0.5)
#> [1] 3.503877
chf(dist, 0.5)
#> [1] 1.705453
mean(dist)
#> [1] 0.5
median(dist)
#> [1] 0
mode(dist)
#> [1] 1
range(dist)
#> [1] 0 1
quantile(dist, 0.2)
#> [1] 0
standard_deviation(dist)
#> [1] 0.5
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.25
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 1
kurtosis_excess(dist)
#> [1] -2

# Convenience functions
bernoulli_pdf(1, 0.5)
#> [1] 0.5
bernoulli_lpdf(1, 0.5)
#> [1] -0.6931472
bernoulli_cdf(1, 0.5)
#> [1] 1
bernoulli_lcdf(1, 0.5)
#> [1] 0
bernoulli_quantile(0.5, 0.5)
#> [1] 0
```

### [Beta Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/beta_dist.html)

``` r
# Beta distribution with shape parameters alpha = 2, beta = 5
dist <- beta_distribution(2, 5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.890625
logcdf(dist, 0.5)
#> [1] -0.1158318
pdf(dist, 0.5)
#> [1] 0.9375
logpdf(dist, 0.5)
#> [1] -0.06453852
hazard(dist, 0.5)
#> [1] 8.571429
chf(dist, 0.5)
#> [1] 2.212973
mean(dist)
#> [1] 0.2857143
median(dist)
#> [1] 0.26445
mode(dist)
#> [1] 0.2
range(dist)
#> [1] 0 1
quantile(dist, 0.2)
#> [1] 0.1398807
standard_deviation(dist)
#> [1] 0.1597191
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.0255102
skewness(dist)
#> [1] 0.5962848
kurtosis(dist)
#> [1] 2.88
kurtosis_excess(dist)
#> [1] -0.12

# Convenience functions
beta_pdf(0.5, 2, 5)
#> [1] 0.9375
beta_lpdf(0.5, 2, 5)
#> [1] -0.06453852
beta_cdf(0.5, 2, 5)
#> [1] 0.890625
beta_lcdf(0.5, 2, 5)
#> [1] -0.1158318
beta_quantile(0.5, 2, 5)
#> [1] 0.26445
```

### [Binomial Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/binomial_dist.html)

``` r
# Binomial dist ribution with n = 10, prob = 0.5
dist <- binomial_distribution(10, 0.5)
# Apply generic functions
cdf(dist, 2)
#> [1] 0.0546875
logcdf(dist, 2)
#> [1] -2.90612
pdf(dist, 2)
#> [1] 0.04394531
logpdf(dist, 2)
#> [1] -3.124809
hazard(dist, 2)
#> [1] 0.0464876
chf(dist, 2)
#> [1] 0.05623972
mean(dist)
#> [1] 5
median(dist)
#> [1] 5
mode(dist)
#> [1] 5
range(dist)
#> [1]  0 10
quantile(dist, 0.2)
#> [1] 3
standard_deviation(dist)
#> [1] 1.581139
support(dist)
#> [1]  0 10
variance(dist)
#> [1] 2.5
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 2.8
kurtosis_excess(dist)
#> [1] -0.2

# Convenience functions
binomial_pdf(3, 10, 0.5)
#> [1] 0.1171875
binomial_lpdf(3, 10, 0.5)
#> [1] -2.14398
binomial_cdf(3, 10, 0.5)
#> [1] 0.171875
binomial_lcdf(3, 10, 0.5)
#> [1] -1.760988
binomial_quantile(0.5, 10, 0.5)
#> [1] 5
```

### [Cauchy Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/cauchy_dist.html)

``` r
# Cauchy distribution with location = 0, scale = 1
dist <- cauchy_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6475836
logcdf(dist, 0.5)
#> [1] -0.4345074
pdf(dist, 0.5)
#> [1] 0.2546479
logpdf(dist, 0.5)
#> [1] -1.367873
hazard(dist, 0.5)
#> [1] 0.7225768
chf(dist, 0.5)
#> [1] 1.042942
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -1.376382
support(dist)
#> [1] -Inf  Inf

# Convenience functions
cauchy_pdf(0)
#> [1] 0.3183099
cauchy_lpdf(0)
#> [1] -1.14473
cauchy_cdf(0)
#> [1] 0.5
cauchy_lcdf(0)
#> [1] -0.6931472
cauchy_quantile(0.5)
#> [1] 0
```

### [Chi-Squared Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/chi_squared_dist.html)

``` r
# Chi-Squared distribution with 3 degrees of freedom
dist <- chi_squared_distribution(3)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.08110859
logcdf(dist, 0.5)
#> [1] -2.511966
pdf(dist, 0.5)
#> [1] 0.2196956
logpdf(dist, 0.5)
#> [1] -1.515512
hazard(dist, 0.5)
#> [1] 0.2390877
chf(dist, 0.5)
#> [1] 0.08458732
mean(dist)
#> [1] 3
median(dist)
#> [1] 2.365974
mode(dist)
#> [1] 1
range(dist)
#> [1]   0 Inf
quantile(dist, 0.2)
#> [1] 1.005174
standard_deviation(dist)
#> [1] 2.44949
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 6
skewness(dist)
#> [1] 1.632993
kurtosis(dist)
#> [1] 7
kurtosis_excess(dist)
#> [1] 4

# Convenience functions
chi_squared_pdf(2, 3)
#> [1] 0.2075537
chi_squared_lpdf(2, 3)
#> [1] -1.572365
chi_squared_cdf(2, 3)
#> [1] 0.4275933
chi_squared_lcdf(2, 3)
#> [1] -0.8495828
chi_squared_quantile(0.5, 3)
#> [1] 2.365974
```

### [Exponential Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/exp_dist.html)

``` r
# Exponential distribution with rate parameter lambda = 2
dist <- exponential_distribution(2)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6321206
logcdf(dist, 0.5)
#> [1] -0.4586751
pdf(dist, 0.5)
#> [1] 0.7357589
logpdf(dist, 0.5)
#> [1] -0.3068528
hazard(dist, 0.5)
#> [1] 2
chf(dist, 0.5)
#> [1] 1
mean(dist)
#> [1] 0.5
median(dist)
#> [1] 0.3465736
mode(dist)
#> [1] 0
range(dist)
#> [1]   0 Inf
quantile(dist, 0.2)
#> [1] 0.1115718
standard_deviation(dist)
#> [1] 0.5
support(dist)
#> [1] 2.225074e-308 1.797693e+308
variance(dist)
#> [1] 0.25
skewness(dist)
#> [1] 2
kurtosis(dist)
#> [1] 9
kurtosis_excess(dist)
#> [1] 6

# Convenience functions
exponential_pdf(1, 2)
#> [1] 0.2706706
exponential_lpdf(1, 2)
#> [1] -1.306853
exponential_cdf(1, 2)
#> [1] 0.8646647
exponential_lcdf(1, 2)
#> [1] -0.1454135
exponential_quantile(0.5, 2)
#> [1] 0.3465736
```

### [Extreme Value Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/extreme_dist.html)

``` r
# Extreme Value distribution with location = 0, scale = 1
dist <- extreme_value_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5452392
logcdf(dist, 0.5)
#> [1] -0.6065307
pdf(dist, 0.5)
#> [1] 0.3307043
logpdf(dist, 0.5)
#> [1] -1.106531
hazard(dist, 0.5)
#> [1] 0.727205
chf(dist, 0.5)
#> [1] 0.7879837
mean(dist)
#> [1] 0.5772157
median(dist)
#> [1] 0.3665129
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.475885
standard_deviation(dist)
#> [1] 1.28255
support(dist)
#> [1] -1.797693e+308  1.797693e+308
variance(dist)
#> [1] 1.644934
skewness(dist)
#> [1] 1.139547
kurtosis(dist)
#> [1] 5.4
kurtosis_excess(dist)
#> [1] 2.4

# Convenience functions
extreme_value_pdf(0)
#> [1] 0.3678794
extreme_value_lpdf(0)
#> [1] -1
extreme_value_cdf(0)
#> [1] 0.3678794
extreme_value_lcdf(0)
#> [1] -1
extreme_value_quantile(0.5)
#> [1] 0.3665129
```

### [F Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/f_dist.html)

``` r
# Fisher F distribution with df1 = 5, df2 = 10
dist <- fisher_f_distribution(5, 10)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.2299751
logcdf(dist, 0.5)
#> [1] -1.469784
pdf(dist, 0.5)
#> [1] 0.687607
logpdf(dist, 0.5)
#> [1] -0.3745378
hazard(dist, 0.5)
#> [1] 0.8929673
chf(dist, 0.5)
#> [1] 0.2613325
mean(dist)
#> [1] 1.25
median(dist)
#> [1] 0.9319332
mode(dist)
#> [1] 0.5
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.4563364
standard_deviation(dist)
#> [1] 1.163687
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 1.354167
skewness(dist)
#> [1] 3.86702
kurtosis(dist)
#> [1] 53.86154
kurtosis_excess(dist)
#> [1] 50.86154

# Convenience functions
fisher_f_pdf(1, 5, 10)
#> [1] 0.4954798
fisher_f_lpdf(1, 5, 10)
#> [1] -0.7022287
fisher_f_cdf(1, 5, 10)
#> [1] 0.5348806
fisher_f_lcdf(1, 5, 10)
#> [1] -0.6257118
fisher_f_quantile(0.5, 5, 10)
#> [1] 0.9319332
```

### [Gamma Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/gamma_dist.html)

``` r
# Gamma distribution with shape = 3, scale = 4
dist <- gamma_distribution(3, 4)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.0002964775
logcdf(dist, 0.5)
#> [1] -8.123539
pdf(dist, 0.5)
#> [1] 0.001723627
logpdf(dist, 0.5)
#> [1] -6.363325
hazard(dist, 0.5)
#> [1] 0.001724138
chf(dist, 0.5)
#> [1] 0.0002965215
mean(dist)
#> [1] 12
median(dist)
#> [1] 10.69624
mode(dist)
#> [1] 8
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 6.140177
standard_deviation(dist)
#> [1] 6.928203
support(dist)
#> [1] 2.225074e-308 1.797693e+308
variance(dist)
#> [1] 48
skewness(dist)
#> [1] 1.154701
kurtosis(dist)
#> [1] 5
kurtosis_excess(dist)
#> [1] 2

# Convenience functions
gamma_pdf(2, 3, 4)
#> [1] 0.01895408
gamma_lpdf(2, 3, 4)
#> [1] -3.965736
gamma_cdf(2, 3, 4)
#> [1] 0.01438768
gamma_lcdf(2, 3, 4)
#> [1] -4.241383
gamma_quantile(0.5, 3, 4)
#> [1] 10.69624
```

### [Geometric Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/geometric_dist.html)

``` r
# Geometric distribution with probability of success prob = 0.5
dist <- geometric_distribution(0.5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6464466
logcdf(dist, 0.5)
#> [1] -0.4362647
pdf(dist, 0.5)
#> [1] 0.3535534
logpdf(dist, 0.5)
#> [1] -1.039721
hazard(dist, 0.5)
#> [1] 1
chf(dist, 0.5)
#> [1] 1.039721
mean(dist)
#> [1] 1
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0
standard_deviation(dist)
#> [1] 1.414214
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 2
skewness(dist)
#> [1] 2.12132
kurtosis(dist)
#> [1] 9.5
kurtosis_excess(dist)
#> [1] 6.5

# Convenience functions
geometric_pdf(3, 0.5)
#> [1] 0.0625
geometric_lpdf(3, 0.5)
#> [1] -2.772589
geometric_cdf(3, 0.5)
#> [1] 0.9375
geometric_lcdf(3, 0.5)
#> [1] -0.06453852
geometric_quantile(0.5, 0.5)
#> [1] 0
```

### [Holtsmark Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/holtsmark_dist.html)

``` r
# Holtsmark distribution with location 0 and scale 1
dist <- holtsmark_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6394042
logcdf(dist, 0.5)
#> [1] -0.4472184
pdf(dist, 0.5)
#> [1] 0.2622968
logpdf(dist, 0.5)
#> [1] -1.338278
hazard(dist, 0.5)
#> [1] 0.7273985
chf(dist, 0.5)
#> [1] 1.019998
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -1.234616
standard_deviation(dist)
#> [1] Inf
support(dist)
#> [1] -Inf  Inf
variance(dist)
#> [1] Inf

# Convenience functions
holtsmark_pdf(3)
#> [1] 0.03150942
holtsmark_lpdf(3)
#> [1] -3.457469
holtsmark_cdf(3)
#> [1] 0.9484022
holtsmark_lcdf(3)
#> [1] -0.05297661
holtsmark_quantile(0.5)
#> [1] 0
```

### [Hyperexponential Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/hyperexponential_dist.html)

``` r
# Hyperexponential distribution with probabilities = c(0.5, 0.5) and rates = c(1, 2)
dist <- hyperexponential_distribution(c(0.5, 0.5), c(1, 2))
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5127949
logcdf(dist, 0.5)
#> [1] -0.6678792
pdf(dist, 0.5)
#> [1] 0.6711448
logpdf(dist, 0.5)
#> [1] -0.3987704
hazard(dist, 0.5)
#> [1] 1.377541
chf(dist, 0.5)
#> [1] 0.7190702
mean(dist)
#> [1] 0.75
median(dist)
#> [1] 0.4812118
mode(dist)
#> [1] 0
range(dist)
#> [1]   0 Inf
quantile(dist, 0.2)
#> [1] 0.1506519
standard_deviation(dist)
#> [1] 0.8291562
support(dist)
#> [1] 2.225074e-308 1.797693e+308
variance(dist)
#> [1] 0.6875
skewness(dist)
#> [1] 2.466911
kurtosis(dist)
#> [1] 12.47107
kurtosis_excess(dist)
#> [1] 9.471074

# Convenience functions
hyperexponential_pdf(2, c(0.5, 0.5), c(1, 2))
#> [1] 0.08598328
hyperexponential_lpdf(2, c(0.5, 0.5), c(1, 2))
#> [1] -2.453602
hyperexponential_cdf(2, c(0.5, 0.5), c(1, 2))
#> [1] 0.9231745
hyperexponential_lcdf(2, c(0.5, 0.5), c(1, 2))
#> [1] -0.07993696
hyperexponential_quantile(0.5, c(0.5, 0.5), c(1, 2))
#> [1] 0.4812118
```

### [Hypergeometric Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/hypergeometric_dist.html)

``` r
# Hypergeometric distribution with r = 5, n = 10, N = 20
dist <- hypergeometric_distribution(5, 10, 20)
# Apply generic functions
cdf(dist, 4)
#> [1] 0.9837461
logcdf(dist, 4)
#> [1] -0.01638741
pdf(dist, 4)
#> [1] 0.1354489
logpdf(dist, 4)
#> [1] -1.999161
hazard(dist, 4)
#> [1] 8.333333
chf(dist, 4)
#> [1] 4.119424
mean(dist)
#> [1] 2.5
median(dist)
#> [1] 3
mode(dist)
#> [1] 3
range(dist)
#> [1] 0 5
quantile(dist, 0.2)
#> [1] 1
standard_deviation(dist)
#> [1] 0.9933993
support(dist)
#> [1] 0 5
variance(dist)
#> [1] 0.9868421
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 5.756863
kurtosis_excess(dist)
#> [1] 2.756863

# Convenience functions
hypergeometric_pdf(3, 5, 10, 20)
#> [1] 0.3482972
hypergeometric_lpdf(3, 5, 10, 20)
#> [1] -1.054699
hypergeometric_cdf(3, 5, 10, 20)
#> [1] 0.8482972
hypergeometric_lcdf(3, 5, 10, 20)
#> [1] -0.1645242
hypergeometric_quantile(0.5, 5, 10, 20)
#> [1] 3
```

### [Inverse Chi-Squared Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_chi_squared_dist.html)

``` r
# Inverse Chi-Squared distribution with 10 degrees of freedom, scale = 1
dist <- inverse_chi_squared_distribution(10, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.02925269
logcdf(dist, 0.5)
#> [1] -3.531784
pdf(dist, 0.5)
#> [1] 0.3783327
logpdf(dist, 0.5)
#> [1] -0.9719812
hazard(dist, 0.5)
#> [1] 0.3897335
chf(dist, 0.5)
#> [1] 0.02968908
mean(dist)
#> [1] 1.25
median(dist)
#> [1] 1.070455
mode(dist)
#> [1] 0.8333333
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.7439393
standard_deviation(dist)
#> [1] 0.7216878
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 0.5208333
skewness(dist)
#> [1] 3.464102
kurtosis(dist)
#> [1] 45
kurtosis_excess(dist)
#> [1] 42

# Convenience functions
inverse_chi_squared_pdf(2, 10, 1)
#> [1] 0.1670024
inverse_chi_squared_lpdf(2, 10, 1)
#> [1] -1.789747
inverse_chi_squared_cdf(2, 10, 1)
#> [1] 0.891178
inverse_chi_squared_lcdf(2, 10, 1)
#> [1] -0.1152111
inverse_chi_squared_quantile(0.5, 10, 1)
#> [1] 1.070455
```

### [Inverse Gamma Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_gamma_dist.html)

``` r
# Inverse Gamma distribution with shape = 5, scale = 4
dist <- inverse_gamma_distribution(5, 4)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.0996324
logcdf(dist, 0.5)
#> [1] -2.306268
pdf(dist, 0.5)
#> [1] 0.9160366
logpdf(dist, 0.5)
#> [1] -0.08769894
hazard(dist, 0.5)
#> [1] 1.017403
chf(dist, 0.5)
#> [1] 0.1049522
mean(dist)
#> [1] 1
median(dist)
#> [1] 0.8563644
mode(dist)
#> [1] 0.6666667
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.5951514
standard_deviation(dist)
#> [1] 0.5773503
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 0.3333333
skewness(dist)
#> [1] 3.464102
kurtosis(dist)
#> [1] 45
kurtosis_excess(dist)
#> [1] 42

# Convenience functions
inverse_gamma_pdf(2, 5, 4)
#> [1] 0.09022352
inverse_gamma_lpdf(2, 5, 4)
#> [1] -2.405465
inverse_gamma_cdf(2, 5, 4)
#> [1] 0.947347
inverse_gamma_lcdf(2, 5, 4)
#> [1] -0.05408985
inverse_gamma_quantile(0.5, 5, 4)
#> [1] 0.8563644
```

### [Inverse Gaussian Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/inverse_gaussian_dist.html)

``` r
# Inverse Gaussian distribution with mu = 3, lambda = 4
dist <- inverse_gaussian_distribution(3, 4)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.01617264
logcdf(dist, 0.5)
#> [1] -4.124435
pdf(dist, 0.5)
#> [1] 0.1403174
logpdf(dist, 0.5)
#> [1] -1.963848
hazard(dist, 0.5)
#> [1] 0.142624
chf(dist, 0.5)
#> [1] 0.01630484
mean(dist)
#> [1] 3
median(dist)
#> [1] 2.202698
mode(dist)
#> [1] 1.140598
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 1.161488
standard_deviation(dist)
#> [1] 2.598076
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 6.75
skewness(dist)
#> [1] 2.598076
kurtosis(dist)
#> [1] 8.25
kurtosis_excess(dist)
#> [1] 11.25

# Convenience functions
inverse_gaussian_pdf(2, 3, 4)
#> [1] 0.2524295
inverse_gaussian_lpdf(2, 3, 4)
#> [1] -1.376623
inverse_gaussian_cdf(2, 3, 4)
#> [1] 0.4512408
inverse_gaussian_lcdf(2, 3, 4)
#> [1] -0.7957542
inverse_gaussian_quantile(0.5, 3, 4)
#> [1] 2.202698
```

### [Kolmogorov-Smirnov Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/kolmogorov_smirnov_dist.html)

``` r
# Kolmogorov-Smirnov distribution with sample size n = 10
dist <- kolmogorov_smirnov_distribution(10)
# Apply generic functions
cdf(dist, 2)
#> [1] 1
logcdf(dist, 2)
#> [1] 0
pdf(dist, 2)
#> [1] 2.887762e-33
logpdf(dist, 2)
#> [1] -74.92483
hazard(dist, 2)
#> [1] 80
chf(dist, 2)
#> [1] 79.30685
mean(dist)
#> [1] 0.2747169
median(dist)
#> [1] 0.2617017
mode(dist)
#> [1] 0.2325754
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.2039076
standard_deviation(dist)
#> [1] 0.08232448
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 0.00677732
skewness(dist)
#> [1] 0.8604261
kurtosis(dist)
#> [1] 3.881619
kurtosis_excess(dist)
#> [1] 0.881619

# Convenience functions
kolmogorov_smirnov_pdf(0.5, 10)
#> [1] 0.2695176
kolmogorov_smirnov_lpdf(0.5, 10)
#> [1] -1.311122
kolmogorov_smirnov_cdf(0.5, 10)
#> [1] 0.9865241
kolmogorov_smirnov_lcdf(0.5, 10)
#> [1] -0.01356751
kolmogorov_smirnov_quantile(0.5, 10)
#> [1] 0.2617017
```

### [Landau Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/landau_dist.html)

``` r
# Landau distribution with location 0 and scale 1
dist <- landau_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.4842393
logcdf(dist, 0.5)
#> [1] -0.7251762
pdf(dist, 0.5)
#> [1] 0.2123185
logpdf(dist, 0.5)
#> [1] -1.549668
hazard(dist, 0.5)
#> [1] 0.4116608
chf(dist, 0.5)
#> [1] 0.6621123
median(dist)
#> [1] 0.5756301
mode(dist)
#> [1] -0.4293145
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.5948319
support(dist)
#> [1] -Inf  Inf

# Convenience functions
landau_pdf(3)
#> [1] 0.05863949
landau_lpdf(3)
#> [1] -2.836347
landau_cdf(3)
#> [1] 0.7792967
landau_lcdf(3)
#> [1] -0.2493635
landau_quantile(0.5)
#> [1] 0.5756301
```

### [Laplace Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/laplace_dist.html)

``` r
# Laplace distribution with location = 0, scale = 1
dist <- laplace_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6967347
logcdf(dist, 0.5)
#> [1] -0.3613506
pdf(dist, 0.5)
#> [1] 0.3032653
logpdf(dist, 0.5)
#> [1] -1.193147
hazard(dist, 0.5)
#> [1] 1
chf(dist, 0.5)
#> [1] 1.193147
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.9162907
standard_deviation(dist)
#> [1] 1.414214
support(dist)
#> [1] -Inf  Inf
variance(dist)
#> [1] 2
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 6
kurtosis_excess(dist)
#> [1] 3

# Convenience functions
laplace_pdf(0)
#> [1] 0.5
laplace_lpdf(0)
#> [1] -0.6931472
laplace_cdf(0)
#> [1] 0.5
laplace_lcdf(0)
#> [1] -0.6931472
laplace_quantile(0.5)
#> [1] 0
```

### [Logistic Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/logistic_dist.html)

``` r
# Logistic distribution with location = 0, scale = 1
dist <- logistic_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6224593
logcdf(dist, 0.5)
#> [1] -0.474077
pdf(dist, 0.5)
#> [1] 0.2350037
logpdf(dist, 0.5)
#> [1] -1.448154
hazard(dist, 0.5)
#> [1] 0.6224593
chf(dist, 0.5)
#> [1] 0.974077
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -1.386294
standard_deviation(dist)
#> [1] 1.813799
support(dist)
#> [1] -1.797693e+308  1.797693e+308
variance(dist)
#> [1] 3.289868
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 4.2
kurtosis_excess(dist)
#> [1] 1.2

# Convenience functions
logistic_pdf(0)
#> [1] 0.25
logistic_lpdf(0)
#> [1] -1.386294
logistic_cdf(0)
#> [1] 0.5
logistic_lcdf(0)
#> [1] -0.6931472
logistic_quantile(0.5)
#> [1] 0
```

### [Log Normal Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/lognormal_dist.html)

``` r
# Log Normal distribution with location = 0, scale = 1
dist <- lognormal_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.2441086
logcdf(dist, 0.5)
#> [1] -1.410142
pdf(dist, 0.5)
#> [1] 0.6274961
logpdf(dist, 0.5)
#> [1] -0.4660179
hazard(dist, 0.5)
#> [1] 0.8301405
chf(dist, 0.5)
#> [1] 0.2798576
mean(dist)
#> [1] 1.648721
median(dist)
#> [1] 1
mode(dist)
#> [1] 0.3678794
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.4310112
standard_deviation(dist)
#> [1] 2.161197
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 4.670774
skewness(dist)
#> [1] 6.184877
kurtosis(dist)
#> [1] 113.9364
kurtosis_excess(dist)
#> [1] 110.9364

# Convenience functions
lognormal_pdf(0)
#> [1] 0
lognormal_lpdf(0)
#> [1] -Inf
lognormal_cdf(0)
#> [1] 0
lognormal_lcdf(0)
#> [1] -Inf
lognormal_quantile(0.5)
#> [1] 1
```

### [Map-Airy Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/mapairy_dist.html)

``` r
# Map-Airy distribution with location 0 and scale 1
dist <- mapairy_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.7527466
logcdf(dist, 0.5)
#> [1] -0.2840266
pdf(dist, 0.5)
#> [1] 0.1477024
logpdf(dist, 0.5)
#> [1] -1.912556
hazard(dist, 0.5)
#> [1] 0.5973726
chf(dist, 0.5)
#> [1] 1.397342
mean(dist)
#> [1] 0
median(dist)
#> [1] -0.7167107
mode(dist)
#> [1] -1.161587
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -1.834427
standard_deviation(dist)
#> [1] Inf
support(dist)
#> [1] -Inf  Inf
variance(dist)
#> [1] Inf

# Convenience functions
mapairy_pdf(3)
#> [1] 0.02799732
mapairy_lpdf(3)
#> [1] -3.575647
mapairy_cdf(3)
#> [1] 0.9316961
mapairy_lcdf(3)
#> [1] -0.07074859
mapairy_quantile(0.5)
#> [1] -0.7167107
```

### [Negative Binomial Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/negative_binomial_dist.html)

``` r
# Negative Binomial distribution with successes = 5, success_fraction = 0.5
dist <- negative_binomial_distribution(5, 0.5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.06449911
logcdf(dist, 0.5)
#> [1] -2.741104
pdf(dist, 0.5)
#> [1] 0.05437955
logpdf(dist, 0.5)
#> [1] -2.911767
hazard(dist, 0.5)
#> [1] 0.05812881
chf(dist, 0.5)
#> [1] 0.06667318
mean(dist)
#> [1] 5
median(dist)
#> [1] 4
mode(dist)
#> [1] 4
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 1
standard_deviation(dist)
#> [1] 3.162278
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 10
skewness(dist)
#> [1] 0.9486833
kurtosis(dist)
#> [1] 4.3
kurtosis_excess(dist)
#> [1] 1.3

# Convenience functions
negative_binomial_pdf(3, 5, 0.5)
#> [1] 0.1367188
negative_binomial_lpdf(3, 5, 0.5)
#> [1] -1.989829
negative_binomial_cdf(3, 5, 0.5)
#> [1] 0.3632812
negative_binomial_lcdf(3, 5, 0.5)
#> [1] -1.012578
negative_binomial_quantile(0.5, 5, 0.5)
#> [1] 4
```

### [Noncentral Beta Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_beta_dist.html)

``` r
# Noncentral Beta distribution with shape parameters alpha = 2, beta = 3
# and noncentrality parameter lambda = 1
dist <- non_central_beta_distribution(2, 3, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5977904
logcdf(dist, 0.5)
#> [1] -0.514515
pdf(dist, 0.5)
#> [1] 1.643543
logpdf(dist, 0.5)
#> [1] 0.4968546
hazard(dist, 0.5)
#> [1] 4.086286
chf(dist, 0.5)
#> [1] 0.910782
mean(dist)
#> [1] 0.44664
median(dist)
#> [1] 0.4416064
mode(dist)
#> [1] 0.4262677
range(dist)
#> [1] 0 1
quantile(dist, 0.2)
#> [1] 0.2549084
standard_deviation(dist)
#> [1] 0.2040433
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.04163366

# Convenience functions
non_central_beta_pdf(0.5, 2, 3, 1)
#> [1] 1.643543
non_central_beta_lpdf(0.5, 2, 3, 1)
#> [1] 0.4968546
non_central_beta_cdf(0.5, 2, 3, 1)
#> [1] 0.5977904
non_central_beta_lcdf(0.5, 2, 3, 1)
#> [1] -0.514515
non_central_beta_quantile(0.5, 2, 3, 1)
#> [1] 0.4416064
```

### [Noncentral Chi-Squared Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_chi_squared_dist.html)

``` r
# Noncentral Chi-Squared distribution with 3 degrees of freedom and noncentrality
# parameter 1
dist <- non_central_chi_squared_distribution(3, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.05162593
logcdf(dist, 0.5)
#> [1] -2.963731
pdf(dist, 0.5)
#> [1] 0.1446374
logpdf(dist, 0.5)
#> [1] -1.933525
hazard(dist, 0.5)
#> [1] 0.1525109
chf(dist, 0.5)
#> [1] 0.05300627
mean(dist)
#> [1] 4
median(dist)
#> [1] 3.213009
mode(dist)
#> [1] 1.439229
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 1.384937
standard_deviation(dist)
#> [1] 3.162278
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 10
skewness(dist)
#> [1] 1.517893
kurtosis(dist)
#> [1] 6.36
kurtosis_excess(dist)
#> [1] 3.36

# Convenience functions
non_central_chi_squared_pdf(2, 3, 1)
#> [1] 0.172252
non_central_chi_squared_lpdf(2, 3, 1)
#> [1] -1.758797
non_central_chi_squared_cdf(2, 3, 1)
#> [1] 0.3082525
non_central_chi_squared_lcdf(2, 3, 1)
#> [1] -1.176836
non_central_chi_squared_quantile(0.5, 3, 1)
#> [1] 3.213009
```

### [Noncentral F Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_f_dist.html)

``` r
# Noncentral F distribution with df1 = 10, df2 = 10 and noncentrality
# parameter 1
dist <- non_central_f_distribution(10, 10, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.1142528
logcdf(dist, 0.5)
#> [1] -2.169342
pdf(dist, 0.5)
#> [1] 0.5754471
logpdf(dist, 0.5)
#> [1] -0.552608
hazard(dist, 0.5)
#> [1] 0.6496742
chf(dist, 0.5)
#> [1] 0.1213237
mean(dist)
#> [1] 1.375
median(dist)
#> [1] 1.10075
mode(dist)
#> [1] 0.7349843
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.6363179
standard_deviation(dist)
#> [1] 1.063113
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 1.130208
skewness(dist)
#> [1] 3.609738
kurtosis(dist)
#> [1] 51.0825
kurtosis_excess(dist)
#> [1] 48.0825

# Convenience functions
non_central_f_pdf(1, 5, 2, 1)
#> [1] 0.3051418
non_central_f_lpdf(1, 5, 2, 1)
#> [1] -1.186979
non_central_f_cdf(1, 5, 2, 1)
#> [1] 0.3737987
non_central_f_lcdf(1, 5, 2, 1)
#> [1] -0.9840377
non_central_f_quantile(0.5, 5, 2, 1)
#> [1] 1.507635
```

### [Noncentral T Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_t_dist.html)

``` r
# Noncentral T distribution with 5 degrees of freedom and noncentrality parameter 1
dist <- non_central_t_distribution(5, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.3021259
logcdf(dist, 0.5)
#> [1] -1.196912
pdf(dist, 0.5)
#> [1] 0.3360046
logpdf(dist, 0.5)
#> [1] -1.090631
hazard(dist, 0.5)
#> [1] 0.4814687
chf(dist, 0.5)
#> [1] 0.3597165
mean(dist)
#> [1] 1.189416
median(dist)
#> [1] 1.052851
mode(dist)
#> [1] 0.8781834
range(dist)
#> [1] -1.797693e+308  1.797693e+308
quantile(dist, 0.2)
#> [1] 0.165306
standard_deviation(dist)
#> [1] 1.385144
support(dist)
#> [1] -1.797693e+308  1.797693e+308
variance(dist)
#> [1] 1.918623
skewness(dist)
#> [1] 1.26633
kurtosis(dist)
#> [1] 13.32067
kurtosis_excess(dist)
#> [1] 10.32067

# Convenience functions
non_central_t_pdf(0, 5, 1)
#> [1] 0.2302431
non_central_t_lpdf(0, 5, 1)
#> [1] -1.46862
non_central_t_cdf(0, 5, 1)
#> [1] 0.1586553
non_central_t_lcdf(0, 5, 1)
#> [1] -1.841022
non_central_t_quantile(0.5, 5, 1)
#> [1] 1.052851
```

### [Normal Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/normal_dist.html)

``` r
# Normal distribution with mean = 0, sd = 1
dist <- normal_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6914625
logcdf(dist, 0.5)
#> [1] -0.3689464
pdf(dist, 0.5)
#> [1] 0.3520653
logpdf(dist, 0.5)
#> [1] -1.043939
hazard(dist, 0.5)
#> [1] 1.141078
chf(dist, 0.5)
#> [1] 1.175912
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.8416212
standard_deviation(dist)
#> [1] 1
support(dist)
#> [1] -Inf  Inf
variance(dist)
#> [1] 1
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 3
kurtosis_excess(dist)
#> [1] 0

# Convenience functions
normal_pdf(0)
#> [1] 0.3989423
normal_lpdf(0)
#> [1] -0.9189385
normal_cdf(0)
#> [1] 0.5
normal_lcdf(0)
#> [1] -0.6931472
normal_quantile(0.5)
#> [1] 0
```

### [Pareto Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/pareto.html)

``` r
# Pareto distribution with scale = 10, shape = 5
dist <- pareto_distribution(10, 5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0
logcdf(dist, 0.5)
#> [1] -Inf
pdf(dist, 0.5)
#> [1] 0
logpdf(dist, 0.5)
#> [1] -Inf
hazard(dist, 0.5)
#> [1] 0
chf(dist, 0.5)
#> [1] 0
mean(dist)
#> [1] 12.5
median(dist)
#> [1] 11.48698
mode(dist)
#> [1] 10
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 10.4564
standard_deviation(dist)
#> [1] 3.227486
support(dist)
#> [1]  1.000000e+01 1.797693e+308
variance(dist)
#> [1] 10.41667
skewness(dist)
#> [1] 4.64758
kurtosis(dist)
#> [1] 73.8
kurtosis_excess(dist)
#> [1] 70.8

# Convenience functions
pareto_pdf(1)
#> [1] 1
pareto_lpdf(1)
#> [1] 0
pareto_cdf(1)
#> [1] 0
pareto_lcdf(1)
#> [1] -Inf
pareto_quantile(0.5)
#> [1] 2
```

### [Poisson Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/poisson_dist.html)

``` r
# Poisson distribution with lambda = 1
dist <- poisson_distribution(1)
# Apply generic functions
cdf(dist, 5)
#> [1] 0.9994058
logcdf(dist, 5)
#> [1] -0.0005943614
pdf(dist, 5)
#> [1] 0.003065662
logpdf(dist, 5)
#> [1] -5.787492
hazard(dist, 5)
#> [1] 5.159442
chf(dist, 5)
#> [1] 7.42832
mean(dist)
#> [1] 1
median(dist)
#> [1] 1
mode(dist)
#> [1] 1
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0
standard_deviation(dist)
#> [1] 1
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 1
skewness(dist)
#> [1] 1
kurtosis(dist)
#> [1] 4
kurtosis_excess(dist)
#> [1] 1

# Convenience functions
poisson_pdf(0, 1)
#> [1] 0.3678794
poisson_lpdf(0, 1)
#> [1] -1
poisson_cdf(0, 1)
#> [1] 0.3678794
poisson_lcdf(0, 1)
#> [1] -1
poisson_quantile(0.5, 1)
#> [1] 1
```

### [Rayleigh Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/rayleigh.html)

``` r
# Rayleigh distribution with sigma = 1
dist <- rayleigh_distribution(1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.1175031
logcdf(dist, 0.5)
#> [1] -2.141291
pdf(dist, 0.5)
#> [1] 0.4412485
logpdf(dist, 0.5)
#> [1] -0.8181472
hazard(dist, 0.5)
#> [1] 0.5
chf(dist, 0.5)
#> [1] 0.125
mean(dist)
#> [1] 1.253314
median(dist)
#> [1] 1.17741
mode(dist)
#> [1] 1
range(dist)
#> [1]   0 Inf
quantile(dist, 0.2)
#> [1] 0.6680472
standard_deviation(dist)
#> [1] 0.6551364
support(dist)
#> [1]  0.000000e+00 1.797693e+308
variance(dist)
#> [1] 0.4292037
skewness(dist)
#> [1] 0.6311107
kurtosis(dist)
#> [1] 3.245089
kurtosis_excess(dist)
#> [1] 0.2450893

# Convenience functions
rayleigh_pdf(1)
#> [1] 0.6065307
rayleigh_lpdf(1)
#> [1] -0.5
rayleigh_cdf(1)
#> [1] 0.3934693
rayleigh_lcdf(1)
#> [1] -0.9327521
rayleigh_quantile(0.5)
#> [1] 1.17741
```

### [SaS Point5 Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/saspoint5_dist.html)

``` r
# SaS Point5 distribution with location 0 and scale 1
dist <- saspoint5_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6686904
logcdf(dist, 0.5)
#> [1] -0.402434
pdf(dist, 0.5)
#> [1] 0.1707624
logpdf(dist, 0.5)
#> [1] -1.767482
hazard(dist, 0.5)
#> [1] 0.5154165
chf(dist, 0.5)
#> [1] 1.104702
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -2.397479
support(dist)
#> [1] -Inf  Inf

# Convenience functions
saspoint5_pdf(3)
#> [1] 0.02379919
saspoint5_lpdf(3)
#> [1] -3.738104
saspoint5_cdf(3)
#> [1] 0.8164545
saspoint5_lcdf(3)
#> [1] -0.2027841
saspoint5_quantile(0.5)
#> [1] 0
```

### [Skew Normal Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/skew_normal_dist.html)

``` r
# Skew Normal distribution with location = 0, scale = 1, shape = 0
dist <- skew_normal_distribution(0, 1, 0)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6914625
logcdf(dist, 0.5)
#> [1] -0.3689464
pdf(dist, 0.5)
#> [1] 0.3520653
logpdf(dist, 0.5)
#> [1] -1.043939
hazard(dist, 0.5)
#> [1] 1.141078
chf(dist, 0.5)
#> [1] 1.175912
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.8416212
standard_deviation(dist)
#> [1] 1
support(dist)
#> [1] -1.797693e+308  1.797693e+308
variance(dist)
#> [1] 1
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 3
kurtosis_excess(dist)
#> [1] 0

# Convenience functions
skew_normal_pdf(0)
#> [1] 0.3989423
skew_normal_lpdf(0)
#> [1] -0.9189385
skew_normal_cdf(0)
#> [1] 0.5
skew_normal_lcdf(0)
#> [1] -0.6931472
skew_normal_quantile(0.5)
#> [1] 0
```

### [Student’s T Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/students_t_dist.html)

``` r
# Student's t distribution with 5 degrees of freedom
dist <- students_t_distribution(5)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.6808506
logcdf(dist, 0.5)
#> [1] -0.3844124
pdf(dist, 0.5)
#> [1] 0.3279185
logpdf(dist, 0.5)
#> [1] -1.11499
hazard(dist, 0.5)
#> [1] 1.027476
chf(dist, 0.5)
#> [1] 1.142096
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -Inf  Inf
quantile(dist, 0.2)
#> [1] -0.9195438
standard_deviation(dist)
#> [1] 1.290994
support(dist)
#> [1] -Inf  Inf
variance(dist)
#> [1] 1.666667
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 9
kurtosis_excess(dist)
#> [1] 6

# Convenience functions
students_t_pdf(0, 5)
#> [1] 0.3796067
students_t_lpdf(0, 5)
#> [1] -0.9686196
students_t_cdf(0, 5)
#> [1] 0.5
students_t_lcdf(0, 5)
#> [1] -0.6931472
students_t_quantile(0.5, 5)
#> [1] 0
```

### [Triangular Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/triangular_dist.html)

``` r
# Triangular distribution with lower = -1, mode = 0, upper = 1
dist <- triangular_distribution(-1, 0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.875
logcdf(dist, 0.5)
#> [1] -0.1335314
pdf(dist, 0.5)
#> [1] 0.5
logpdf(dist, 0.5)
#> [1] -0.6931472
hazard(dist, 0.5)
#> [1] 4
chf(dist, 0.5)
#> [1] 2.079442
mean(dist)
#> [1] 0
median(dist)
#> [1] 0
mode(dist)
#> [1] 0
range(dist)
#> [1] -1.797693e+308  1.797693e+308
quantile(dist, 0.2)
#> [1] -0.3675445
standard_deviation(dist)
#> [1] 0.4082483
support(dist)
#> [1] -1  1
variance(dist)
#> [1] 0.1666667
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 2.4
kurtosis_excess(dist)
#> [1] -0.6

# Convenience functions
triangular_pdf(1)
#> [1] 0
triangular_lpdf(1)
#> [1] -Inf
triangular_cdf(1)
#> [1] 1
triangular_lcdf(1)
#> [1] 0
triangular_quantile(0.5)
#> [1] 0
```

### [Uniform Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/uniform_dist.html)

``` r
# Uniform distribution with lower = 0, upper = 1
dist <- uniform_distribution(0, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.5
logcdf(dist, 0.5)
#> [1] -0.6931472
pdf(dist, 0.5)
#> [1] 1
logpdf(dist, 0.5)
#> [1] 0
hazard(dist, 0.5)
#> [1] 2
chf(dist, 0.5)
#> [1] 0.6931472
mean(dist)
#> [1] 0.5
median(dist)
#> [1] 0.5
mode(dist)
#> [1] 0
range(dist)
#> [1] -1.797693e+308  1.797693e+308
quantile(dist, 0.2)
#> [1] 0.2
standard_deviation(dist)
#> [1] 0.2886751
support(dist)
#> [1] 0 1
variance(dist)
#> [1] 0.08333333
skewness(dist)
#> [1] 0
kurtosis(dist)
#> [1] 1.8
kurtosis_excess(dist)
#> [1] -1.2

# Convenience functions
uniform_pdf(0.5)
#> [1] 1
uniform_lpdf(0.5)
#> [1] 0
uniform_cdf(0.5)
#> [1] 0.5
uniform_lcdf(0.5)
#> [1] -0.6931472
uniform_quantile(0.5)
#> [1] 0.5
```

### [Weibull Distribution](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/weibull_dist.html)

``` r
# Weibull distribution with shape = 1, scale = 1
dist <- weibull_distribution(1, 1)
# Apply generic functions
cdf(dist, 0.5)
#> [1] 0.3934693
logcdf(dist, 0.5)
#> [1] -0.9327521
pdf(dist, 0.5)
#> [1] 0.6065307
logpdf(dist, 0.5)
#> [1] -0.5
hazard(dist, 0.5)
#> [1] 1
chf(dist, 0.5)
#> [1] 0.5
mean(dist)
#> [1] 1
median(dist)
#> [1] 0.6931472
mode(dist)
#> [1] 0
range(dist)
#> [1]  0.000000e+00 1.797693e+308
quantile(dist, 0.2)
#> [1] 0.2231436
standard_deviation(dist)
#> [1] 1
support(dist)
#> [1] 2.225074e-308 1.797693e+308
variance(dist)
#> [1] 1
skewness(dist)
#> [1] 2
kurtosis(dist)
#> [1] 9
kurtosis_excess(dist)
#> [1] 6

# Convenience functions
weibull_pdf(1, shape = 1, scale = 1)
#> [1] 0.3678794
weibull_lpdf(1, shape = 1, scale = 1)
#> [1] -1
weibull_cdf(1, shape = 1, scale = 1)
#> [1] 0.6321206
weibull_lcdf(1, shape = 1, scale = 1)
#> [1] -0.4586751
weibull_quantile(0.5, shape = 1, scale = 1)
#> [1] 0.6931472
```
