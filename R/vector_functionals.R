#' @title Vector Functionals
#' @name vector_functionals
#' @description Functions to compute various vector norms and distances.
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/vector_functionals.html) for more details on the mathematical background.
#' @param x A numeric vector.
#' @param y A numeric vector of the same length as `x` (for distance functions).
#' @param p A positive integer indicating the order of the norm or distance (for Lp functions).
#' @return A single numeric value with the computed norm or distance.
#' @examples
#' # L0 Pseudo Norm
#' l0_pseudo_norm(c(1, 0, 2, 0, 3))
#' # Hamming Distance
#' hamming_distance(c(1, 0, 1), c(0, 1, 1))
#' # L1 Norm
#' l1_norm(c(1, -2, 3))
#' # L1 Distance
#' l1_distance(c(1, -2, 3), c(4, -5, 6))
#' # L2 Norm
#' l2_norm(c(3, 4))
#' # L2 Distance
#' l2_distance(c(3, 4), c(0, 0))
#' # Supremum Norm
#' sup_norm(c(1, -2, 3))
#' # Supremum Distance
#' sup_distance(c(1, -2, 3), c(4, -5, 6))
#' # Lp Norm
#' lp_norm(c(1, -2, 3), 3)
#' # Lp Distance
#' lp_distance(c(1, -2, 3), c(4, -5, 6), 3)
#' # Total Variation
#' total_variation(c(1, 2, 1, 3))
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
