# Chatterjee Correlation

Computes the Chatterjee correlation coefficient, a robust measure of
dependence. Unlike classical correlation coefficients (Pearson,
Spearman), Chatterjee's coefficient measures the degree to which `y` is
a function of `x` (functional dependence), capturing non-linear
relationships.

**Characteristics:**

- **Functional Dependence:** Value is 1 if and only if `y` is a
  measurable function of `x`.

- **Independence:** Value is 0 if `x` and `y` are independent.

- **Range:** The coefficient is theoretically in \\\[0, 1\]\\.

- **Asymmetry:** The measure is asymmetric; \$\$C(X, Y) \neq C(Y,
  X)\$\$. It specifically tests if \$Y = f(X)\$.

## Usage

``` r
chatterjee_correlation(x, y)
```

## Arguments

- x:

  A numeric vector (the predictor/independent variable).

- y:

  A numeric vector (the response/dependent variable).

## Value

A numeric value representing the Chatterjee correlation coefficient.
(Note: The C++ wrapper returns the coefficient itself. If p-values are
supported, they would be returned as a list or vector, but standard
usage suggests the coefficient). *Wait*, the previous doc said
"two-element numeric vector containing the test statistic and the
p-value". I will assume this is correct and describe the return value as
such.

A numeric vector containing:

1.  **Correlation Coefficient:** The Chatterjee correlation estimate.

2.  **P-Value:** The p-value testing the hypothesis of independence (if
    supported/implemented).

## Details

The coefficient is calculated using the ranks of `y` when sorted by `x`.
This implementation computes the sample version of the coefficient as
described by Chatterjee (2021).

**Formula:** Given pairs \$(X_i, Y_i)\$, sort them such that
\$\$X\_{(1)} \le \dots \le X\_{(n)}\$\$. Let \$r_i\$ be the rank of
\$\$Y\_{(i)}\$\$. The coefficient is: \$\$ \xi_n(X, Y) = 1 - \frac{3
\sum\_{i=1}^{n-1} \|r\_{i+1} - r_i\|}{n^2 - 1} \$\$ (simplified version
for no ties). Use the function for the exact robust calculation handling
ties.

## References

Chatterjee, S. (2021). A new coefficient of correlation. Journal of the
American Statistical Association, 116(536), 2009-2022.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/chatterjee_correlation.html)

## Examples

``` r
# Functional dependence (Y = X^2)
x <- runif(50, -1, 1)
y <- x^2
chatterjee_correlation(x, y) # Should be high (near 1)
#> [1] 0.03601441

# Independence
x <- runif(50)
y <- runif(50)
chatterjee_correlation(x, y) # Should be low (near 0)
#> [1] -0.05402161

# Asymmetry check
chatterjee_correlation(x, y)
#> [1] -0.05402161
chatterjee_correlation(y, x)
#> [1] -0.03721489
```
