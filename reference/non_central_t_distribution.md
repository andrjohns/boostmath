# Noncentral T Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Noncentral T
distribution.

The noncentral T distribution is a generalization of the Student's t
Distribution.

The PDF is:

\$\$f(x;\nu;\delta) = \frac{\nu^{\nu/2}\\\nu!} {2^{\nu} e^{\delta^{2}/2}
(\nu+x^{2})^{\nu/2}\Gamma\\\left(\frac{\nu}{2}\right)} \left(
\frac{\sqrt{2}\\\delta x\\ {}\_1F_1\\\left(\frac{\nu}{2}+1;\frac{3}{2};
\frac{\delta^{2}x^{2}}{2(\nu+x^{2})}\right)}
{(\nu+x^{2})\Gamma\\\left(\frac{\nu+1}{2}\right)} + \frac{
{}\_1F_1\\\left(\frac{\nu+1}{2};\frac{1}{2};
\frac{\delta^{2}x^{2}}{2(\nu+x^{2})}\right)}
{\sqrt{\nu+x^{2}}\Gamma\\\left(\frac{\nu}{2}+1\right)} \right)\$\$

The CDF is:

\$\$F(t;\nu;\delta) = \Phi(-\delta) + \frac{1}{2} \sum\_{i=0}^{\infty}
\left( P_i\\ I_x\\\left(i+\frac{1}{2},\frac{\nu}{2}\right) +
\frac{\delta}{\sqrt{2}}\\ Q_i\\ I_x\\\left(i+1,\frac{\nu}{2}\right)
\right)\$\$

Where:

\$\$P_i = e^{-\delta^{2}/2} \frac{\left(\delta^{2}/2\right)^i}{i!},
\qquad Q_i = e^{-\delta^{2}/2}
\frac{\left(\delta^{2}/2\right)^i}{\Gamma\\\left(i+\frac{3}{2}\right)},
\qquad x = \frac{t^{2}}{\nu+t^{2}}\$\$

## Usage

``` r
non_central_t_distribution(df, delta)

non_central_t_pdf(x, df, delta)

non_central_t_lpdf(x, df, delta)

non_central_t_cdf(x, df, delta)

non_central_t_lcdf(x, df, delta)

non_central_t_quantile(p, df, delta)
```

## Arguments

- df:

  degrees of freedom (df \> 0)

- delta:

  noncentrality parameter (delta \>= 0)

- x:

  quantile

- p:

  probability (0 \<= p \<= 1)

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_t_dist.html)
for more details on the mathematical background.

## Examples

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
