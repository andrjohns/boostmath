#' @title Vector Norms and Distances
#' @name vector_functionals
#' @description
#' Functions to compute various vector norms, distances, and functional properties.
#' These functionals form the basis of many numerical analysis and signal processing algorithms.
#'
#' **Norms (Magnitude):**
#' *   `l1_norm`: Computes the L1 norm (Manhattan norm), sum of absolute values.
#' *   `l2_norm`: Computes the L2 norm (Euclidean norm), square root of sum of squares.
#' *   `sup_norm`: Computes the Supremum (L-infinity) norm, the maximum absolute value.
#' *   `lp_norm`: Computes the Lp norm for an arbitrary integer `p`.
#'
#' **Distances (Difference):**
#' *   `l1_distance`: Computes the L1 distance between two vectors.
#' *   `l2_distance`: Computes the L2 (Euclidean) distance between two vectors.
#' *   `sup_distance`: Computes the Supremum (L-infinity) distance/Chebyshev distance.
#' *   `lp_distance`: Computes the Lp distance for an arbitrary integer `p`.
#'
#' **Sparsity & Structure:**
#' *   `l0_pseudo_norm`: Counts the number of non-zero elements (Hamming weight).
#' *   `hamming_distance`: Counts the number of mismatching elements between two vectors.
#' *   `total_variation`: Computes the total variation (sum of absolute differences between adjacent elements).
#'
#' @details
#' *   **L0 Pseudo-Norm:** Not a true norm (doesn't satisfy homogeneity), but useful for sparsity (e.g., Compressed Sensing).
#' *   **L1 Norm:** Often used in sparse signal recovery (LASSO).
#' *   **Total Variation:** Useful in signal processing for denoising while preserving edges (Total Variation Denoising).
#'
#' The implementations are designed to be efficient and work with various numeric types.
#'
#' @param x A numeric vector.
#' @param y A numeric vector of the same length as `x` (for distance functions).
#' @param p A positive integer indicating the order of the norm or distance (for Lp functions).
#'
#' @return A single numeric value with the computed norm or distance.
#'
#' @references
#' Higham, N. J. (2002). Accuracy and stability of numerical algorithms. SIAM.
#' Mallat, S. (2008). A wavelet tour of signal processing: the sparse way. Academic press.
#'
#' @seealso
#' [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/vector_functionals.html)
#'
#' @examples
#' v1 <- c(1, -2, 3)
#' v2 <- c(4, -5, 6)
#'
#' # --- Norms ---
#' l1_norm(v1)      # |1| + |-2| + |3| = 6
#' l2_norm(v1)      # sqrt(1^2 + (-2)^2 + 3^2) = sqrt(14)
#' sup_norm(v1)     # max(|1|, |-2|, |3|) = 3
#' lp_norm(v1, 3)   # Cube root of sum of cubes
#'
#' # --- Distances ---
#' l1_distance(v1, v2)
#' l2_distance(v1, v2)
#' hamming_distance(c(1, 0, 1), c(0, 1, 1)) # 2 differences (pos 1 and 2)
#'
#' # --- Structure ---
#' l0_pseudo_norm(c(0, 5, 0, 2)) # Returns 2 (two non-zeros)
#' total_variation(c(1, 5, 2))   # |5-1| + |2-5| = 4 + 3 = 7
NULL

#' @rdname vector_functionals
#' @export
l0_pseudo_norm <- function(x) {
  .Call(`l0_pseudo_norm_`, x)
}

#' @rdname vector_functionals
#' @export
hamming_distance <- function(x, y) {
  .Call(`hamming_distance_`, x, y)
}

#' @rdname vector_functionals
#' @export
l1_norm <- function(x) {
  .Call(`l1_norm_`, x)
}

#' @rdname vector_functionals
#' @export
l1_distance <- function(x, y) {
  .Call(`l1_distance_`, x, y)
}

#' @rdname vector_functionals
#' @export
l2_norm <- function(x) {
  .Call(`l2_norm_`, x)
}

#' @rdname vector_functionals
#' @export
l2_distance <- function(x, y) {
  .Call(`l2_distance_`, x, y)
}

#' @rdname vector_functionals
#' @export
sup_norm <- function(x) {
  .Call(`sup_norm_`, x)
}

#' @rdname vector_functionals
#' @export
sup_distance <- function(x, y) {
  .Call(`sup_distance_`, x, y)
}

#' @rdname vector_functionals
#' @export
lp_norm <- function(x, p) {
  .Call(`lp_norm_`, x, p)
}

#' @rdname vector_functionals
#' @export
lp_distance <- function(x, y, p) {
  .Call(`lp_distance_`, x, y, p)
}

#' @rdname vector_functionals
#' @export
total_variation <- function(x) {
  .Call(`total_variation_`, x)
}
