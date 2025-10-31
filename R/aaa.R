#' @export
cdf <- function(x, ...) {
  UseMethod("cdf")
}

#' @export
logcdf <- function(x, ...) {
  UseMethod("logcdf")
}

#' @export
pdf <- function(x, ...) {
  UseMethod("pdf")
}

#' @export
logpdf <- function(x, ...) {
  UseMethod("logpdf")
}

#' @export
hazard <- function(x, ...) {
  UseMethod("hazard")
}

#' @export
chf <- function(x, ...) {
  UseMethod("chf")
}

#' @export
mode <- function(x, ...) {
  UseMethod("mode")
}

#' @export
standard_deviation <- function(x, ...) {
  UseMethod("standard_deviation")
}

#' @export
support <- function(x, ...) {
  UseMethod("support")
}

#' @export
variance <- function(x, ...) {
  UseMethod("variance")
}

#' @export
skewness <- function(x, ...) {
  UseMethod("skewness")
}

#' @export
kurtosis <- function(x, ...) {
  UseMethod("kurtosis")
}

#' @export
kurtosis_excess <- function(x, ...) {
  UseMethod("kurtosis_excess")
}

