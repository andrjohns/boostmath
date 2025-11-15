# Condition Numbers

Functions to compute condition numbers for summation operations.

## Usage

``` r
summation_condition_number(x = 0, kahan = TRUE)

evaluation_condition_number(f, x)
```

## Arguments

- x:

  A numeric value.

- kahan:

  A logical value indicating whether to use Kahan summation.

- f:

  A function for which to compute the condition number.

## Value

For `summation_condition_number`, an object with methods to compute the
condition number, sum, L1 norm, and to add or subtract values. For
`evaluation_condition_number`, a numeric value representing the
condition number of the function evaluation at `x`.

## Examples

``` r
# Create a summation condition number object
scn <- summation_condition_number(kahan = TRUE)
# Add some values
scn$add(1.0)
scn$add(2.0)
scn$add(3.0)
# Compute sum, condition number, and L1 norm
print(scn$sum())
#> [1] 6
print(scn$condition_number())
#> [1] 1
print(scn$l1_norm())
#> [1] 6
# Compute evaluation condition number for a function
f <- function(x) { x^2 + 3*x + 2 }
print(evaluation_condition_number(f, 1.0))
#> [1] 0.8333333
```
