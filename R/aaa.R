dist_function <- function(fun_name, x, ...) {
  dist_name <- setdiff(class(x), "boost_distribution")
  dist_name <- gsub("_distribution$", "", dist_name)
  # Bernoulli distribution uses binomial Boost functions
  if (dist_name == "bernoulli") {
    dist_name <- "binomial"
  }
  fun_dll <- paste0(".Call(`", dist_name, "_", fun_name, "_ptr_`, x$extptr, ...)")
  eval(parse(text = fun_dll))
}

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
mean <- function(x, ...) {
  UseMethod("mean")
}

#' @export
median <- function(x, ...) {
  UseMethod("median")
}

#' @export
mode <- function(x, ...) {
  UseMethod("mode")
}

#' @export
quantile <- function(x, ...) {
  UseMethod("quantile")
}

#' @export
range <- function(x, ...) {
  UseMethod("range")
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

#' @exportS3Method cdf boost_distribution
cdf.boost_distribution <- function(x, y, ...) {
  dist_function("cdf", x, y)
}

#' @exportS3Method logcdf boost_distribution
logcdf.boost_distribution <- function(x, y, ...) {
  dist_function("logcdf", x, y)
}

#' @exportS3Method pdf boost_distribution
pdf.boost_distribution <- function(x, y, ...) {
  dist_function("pdf", x, y)
}

#' @exportS3Method logpdf boost_distribution
logpdf.boost_distribution <- function(x, y, ...) {
  dist_function("logpdf", x, y)
}

#' @exportS3Method hazard boost_distribution
hazard.boost_distribution <- function(x, y, ...) {
  dist_function("hazard", x, y)
}

#' @exportS3Method chf boost_distribution
chf.boost_distribution <- function(x, y, ...) {
  dist_function("chf", x, y)
}

#' @exportS3Method mean boost_distribution
mean.boost_distribution <- function(x, ...) {
  dist_function("mean", x)
}

#' @exportS3Method median boost_distribution
median.boost_distribution <- function(x, ...) {
  dist_function("median", x)
}

#' @exportS3Method mode boost_distribution
mode.boost_distribution <- function(x, ...) {
  dist_function("mode", x)
}

#' @exportS3Method range boost_distribution
range.boost_distribution <- function(x, ...) {
  dist_function("range", x)
}

#' @exportS3Method quantile boost_distribution
quantile.boost_distribution <- function(x, y, ...) {
  dist_function("quantile", x, y)
}

#' @exportS3Method standard_deviation boost_distribution
standard_deviation.boost_distribution <- function(x, ...) {
  dist_function("standard_deviation", x)
}

#' @exportS3Method support boost_distribution
support.boost_distribution <- function(x, ...) {
  dist_function("support", x)
}

#' @exportS3Method variance boost_distribution
variance.boost_distribution <- function(x, ...) {
  dist_function("variance", x)
}

#' @exportS3Method skewness boost_distribution
skewness.boost_distribution <- function(x, ...) {
  dist_function("skewness", x)
}

#' @exportS3Method kurtosis boost_distribution
kurtosis.boost_distribution <- function(x, ...) {
  dist_function("kurtosis", x)
}

#' @exportS3Method kurtosis_excess boost_distribution
kurtosis_excess.boost_distribution <- function(x, ...) {
  dist_function("kurtosis_excess", x)
}
