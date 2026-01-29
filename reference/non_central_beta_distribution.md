# Noncentral Beta Distribution Functions

Functions to compute the probability density function, cumulative
distribution function, and quantile function for the Noncentral Beta
distribution.

The noncentral beta distribution is a generalization of the Beta
Distribution.

It is defined as the ratio \$\$X =
\frac{\chi_m^2(\lambda)}{\chi_m^2(\lambda) + \chi_n^2}\$\$ where
\\\chi_m^2(\lambda)\\ is a noncentral \\\chi^2\\ random variable with
\\m\\ degrees of freedom, and \\\chi_n^2\\ is a central \\\chi^2\\
random variable with \\n\\ degrees of freedom.

This gives a PDF that can be expressed as a Poisson mixture of beta
distribution PDFs: \$\$f(x; \alpha, \beta, \lambda) =
\sum\_{i=0}^{\infty} P(i; \lambda/2) I'\_x(\alpha+i, \beta)\$\$ where
\\P(i; \lambda/2)\\ is the discrete Poisson probability at \\i\\, with
mean \\\lambda/2\\, and \\I'\_x(\alpha, \beta)\\ is the derivative of
the incomplete beta function.

This leads to the usual form of the CDF as: \$\$F(x; \alpha, \beta,
\lambda) = \sum\_{i=0}^{\infty} P(i; \lambda/2) I_x(\alpha+i, \beta)\$\$
where \\I_x(\alpha, \beta)\\ is the incomplete beta function.

**Accuracy and Implementation Notes:** The CDF and its complement are
evaluated using the approximation due to Chattamvelli and Shanmugam to
determine the crossover point (mean). Then either the CDF or its
complement is computed using the relations above. The summation is
performed by starting at \\i = \lambda/2\\, and then recursing in both
directions ("Method 2" by Benton and Krishnamoorthy). Quantiles are
computed using a specially modified version of bracket and solve,
starting the search for the root at the mean of the distribution.

## Usage

``` r
non_central_beta_distribution(alpha, beta, lambda)

non_central_beta_pdf(x, alpha, beta, lambda)

non_central_beta_lpdf(x, alpha, beta, lambda)

non_central_beta_cdf(x, alpha, beta, lambda)

non_central_beta_lcdf(x, alpha, beta, lambda)

non_central_beta_quantile(p, alpha, beta, lambda)
```

## Arguments

- alpha:

  first shape parameter (alpha \> 0)

- beta:

  second shape parameter (beta \> 0)

- lambda:

  noncentrality parameter (lambda \>= 0)

- x:

  quantile (0 \<= x \<= 1)

- p:

  probability (0 \<= p \<= 1)

## Value

A single numeric value with the computed probability density,
log-probability density, cumulative distribution, log-cumulative
distribution, or quantile depending on the function called.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/nc_beta_dist.html)
for more details on the mathematical background.

## Examples

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
