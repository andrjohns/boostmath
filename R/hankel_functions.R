#' @title Hankel Functions
#' @description
#' Functions to compute cylindrical and spherical Hankel functions of the first and second kinds.
#'
#' Hankel functions are complex-valued combinations of Bessel functions that are particularly
#' useful in solving wave equations and problems involving cylindrical or spherical symmetry.
#'
#' **Cylindrical Hankel Functions:**
#'
#' * **First Kind:**
#'   \deqn{H_v^{(1)}(x) = J_v(x) + i Y_v(x)}
#'   where J_v is the Bessel function of the first kind and Y_v is the Bessel function
#'   of the second kind.
#'
#' * **Second Kind:**
#'   \deqn{H_v^{(2)}(x) = J_v(x) - i Y_v(x)}
#'
#' These functions return complex-valued results. Computing a single Hankel function call
#' is more efficient than making separate calls to the Bessel J and Y functions, since both
#' components are calculated simultaneously.
#'
#' **Spherical Hankel Functions:**
#'
#' Spherical variants h_v^(1) and h_v^(2) are implemented in terms of the cylindrical
#' Hankel functions and are used in problems with spherical symmetry, such as
#' electromagnetic wave propagation.
#'
#' All functions operate across the entire range of v and x values and return complex numbers.
#'
#' @seealso [Boost Documentation](https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/hankel.html) for more details on the mathematical background.
#' @name hankel_functions
#' @param v Order of the Hankel function (can be any real number)
#' @param x Argument of the Hankel function (can be any real number)
#' @return A single complex value with the computed Hankel function.
#' @examples
#' cyl_hankel_1(2, 0.5)
#' cyl_hankel_2(2, 0.5)
#' sph_hankel_1(2, 0.5)
#' sph_hankel_2(2, 0.5)
NULL

#' @rdname hankel_functions
#' @export
cyl_hankel_1 <- function(v, x) {
  .Call(`cyl_hankel_1_`, v, x)
}

#' @rdname hankel_functions
#' @export
cyl_hankel_2 <- function(v, x) {
  .Call(`cyl_hankel_2_`, v, x)
}

#' @rdname hankel_functions
#' @export
sph_hankel_1 <- function(v, x) {
  .Call(`sph_hankel_1_`, v, x)
}

#' @rdname hankel_functions
#' @export
sph_hankel_2 <- function(v, x) {
  .Call(`sph_hankel_2_`, v, x)
}
