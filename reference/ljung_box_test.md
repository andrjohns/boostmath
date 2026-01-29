# Ljung-Box Test for Autocorrelation

Functions to perform the Ljung-Box test for autocorrelation in
residuals.

The test statistic is

\$\$Q = n(n+2)\sum\_{k=1}^{\ell} \frac{\hat{\rho}\_k^2}{n-k}\$\$

where \$n\$ is the sample size, \$\$\ell\$\$ is the number of lags, and
\$\$\hat{\rho}\_k\$\$ are sample autocorrelations. The p-value is
computed against a chi-squared approximation with adjusted degrees of
freedom.

**Implementation Notes:** By default, the number of lags is chosen as
\$\$\log(n)\$\$ for \$\$O(n \log n)\$\$ complexity. `fit_dof` adjusts
only the p-value to account for model parameters.

## Usage

``` r
ljung_box(v, lags = -1, fit_dof = 0)
```

## Arguments

- v:

  A numeric vector.

- lags:

  A single integer value (default uses \$\$\log(n)\$\$).

- fit_dof:

  A single integer value.

## Value

A two-element numeric vector containing the test statistic and the
p-value.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/ljung_box.html)
for more details on the mathematical background.

## Examples

``` r
# Ljung-Box test for autocorrelation
ljung_box(c(1, 2, 3, 4, 5), lags = 2, fit_dof = 0)
#> [1] 1.5166667 0.4684465
```
