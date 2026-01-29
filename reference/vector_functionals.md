# Vector Norms and Distances

Functions to compute various vector norms, distances, and functional
properties. These functionals form the basis of many numerical analysis
and signal processing algorithms.

**Norms (Magnitude):**

- `l1_norm`: Computes the L1 norm (Manhattan norm), sum of absolute
  values.

- `l2_norm`: Computes the L2 norm (Euclidean norm), square root of sum
  of squares.

- `sup_norm`: Computes the Supremum (L-infinity) norm, the maximum
  absolute value.

- `lp_norm`: Computes the Lp norm for an arbitrary integer `p`.

**Distances (Difference):**

- `l1_distance`: Computes the L1 distance between two vectors.

- `l2_distance`: Computes the L2 (Euclidean) distance between two
  vectors.

- `sup_distance`: Computes the Supremum (L-infinity) distance/Chebyshev
  distance.

- `lp_distance`: Computes the Lp distance for an arbitrary integer `p`.

**Sparsity & Structure:**

- `l0_pseudo_norm`: Counts the number of non-zero elements (Hamming
  weight).

- `hamming_distance`: Counts the number of mismatching elements between
  two vectors.

- `total_variation`: Computes the total variation (sum of absolute
  differences between adjacent elements).

## Usage

``` r
l0_pseudo_norm(x)

hamming_distance(x, y)

l1_norm(x)

l1_distance(x, y)

l2_norm(x)

l2_distance(x, y)

sup_norm(x)

sup_distance(x, y)

lp_norm(x, p)

lp_distance(x, y, p)

total_variation(x)
```

## Arguments

- x:

  A numeric vector.

- y:

  A numeric vector of the same length as `x` (for distance functions).

- p:

  A positive integer indicating the order of the norm or distance (for
  Lp functions).

## Value

A single numeric value with the computed norm or distance.

## Details

- **L0 Pseudo-Norm:** Not a true norm (doesn't satisfy homogeneity), but
  useful for sparsity (e.g., Compressed Sensing).

- **L1 Norm:** Often used in sparse signal recovery (LASSO).

- **Total Variation:** Useful in signal processing for denoising while
  preserving edges (Total Variation Denoising).

The implementations are designed to be efficient and work with various
numeric types.

## References

Higham, N. J. (2002). Accuracy and stability of numerical algorithms.
SIAM. Mallat, S. (2008). A wavelet tour of signal processing: the sparse
way. Academic press.

## See also

[Boost
Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/vector_functionals.html)

## Examples

``` r
v1 <- c(1, -2, 3)
v2 <- c(4, -5, 6)

# --- Norms ---
l1_norm(v1)      # |1| + |-2| + |3| = 6
#> [1] 6
l2_norm(v1)      # sqrt(1^2 + (-2)^2 + 3^2) = sqrt(14)
#> [1] 3.741657
sup_norm(v1)     # max(|1|, |-2|, |3|) = 3
#> [1] 3
lp_norm(v1, 3)   # Cube root of sum of cubes
#> [1] 3.301927

# --- Distances ---
l1_distance(v1, v2)
#> [1] 9
l2_distance(v1, v2)
#> [1] 5.196152
hamming_distance(c(1, 0, 1), c(0, 1, 1)) # 2 differences (pos 1 and 2)
#> [1] 2

# --- Structure ---
l0_pseudo_norm(c(0, 5, 0, 2)) # Returns 2 (two non-zeros)
#> [1] 2
total_variation(c(1, 5, 2))   # |5-1| + |2-5| = 4 + 3 = 7
#> [1] 7
```
