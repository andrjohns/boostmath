#' @title Hankel Functions
#' @description
#' Functions to compute cylindrical and spherical Hankel functions of the first and second kinds.
#'
#' **Cyclic Hankel Functions**
#'
#' * `cyl_hankel_1(v, x)`: The Hankel function of the first kind: \eqn{H_v^{(1)}(x) = J_v(x) + iY_v(x)}
#' * `cyl_hankel_2(v, x)`: The Hankel function of the second kind: \eqn{H_v^{(2)}(x) = J_v(x) - iY_v(x)}
#'
#' Where \eqn{J_v(x)} is the Bessel function of the first kind and \eqn{Y_v(x)} is the Bessel function
#' of the second kind.
#'
#' **Spherical Hankel Functions:**
#'
#' * `sph_hankel_1(v, x)`: The spherical Hankel function of the first kind: \eqn{h_v^{(1)}(x)  = \sqrt{\frac{\pi}{2}}\frac{1}{\sqrt{\pi}}H_{v + \frac{1}{2}}^{(1)}(x)}
#' * `sph_hankel_2(v, x)`: The spherical Hankel function of the second kind: \eqn{h_v^{(2)}(x)  = \sqrt{\frac{\pi}{2}}\frac{1}{\sqrt{\pi}}H_{v + \frac{1}{2}}^{(2)}(x)}
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
