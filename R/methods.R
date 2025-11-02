dist_function <- function(fun_name, x, ...) {
  dist_name <- setdiff(class(x), "boost_distribution")
  dist_name <- gsub("_distribution$", "", dist_name)
  # Bernoulli distribution uses binomial Boost functions
  if (dist_name == "bernoulli") {
    dist_name <- "binomial"
  }
  dll_call <- paste0(".Call(`", dist_name, "_", fun_name, "_ptr_`, x$extptr, ...)")
  eval(parse(text = dll_call))
}

#' @title Generic Distribution Functions
#' @name generic_distribution_functions
#' @description Generic functions for computing various properties of statistical distributions.
#' @param x A distribution object created by a distribution constructor function.
#' @param ... Additional arguments passed to specific methods.
#' @return A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, quantile, mean, median, mode, range, standard deviation, support, variance, skewness, kurtosis, or excess kurtosis depending on the function called.
#' @examples
#' # Create a Weibull distribution
#' weibull_dist <- weibull_distribution(shape = 2, scale = 1)
#' # Compute the CDF at a specific point
#' cdf(weibull_dist, 1)
#' # Check support
#' support(weibull_dist)
NULL

#' @rdname generic_distribution_functions
#' @export
cdf <- function(x, ...) {
  UseMethod("cdf")
}

#' @rdname generic_distribution_functions
#' @export
logcdf <- function(x, ...) {
  UseMethod("logcdf")
}

#' @rdname generic_distribution_functions
#' @export
pdf <- function(x, ...) {
  UseMethod("pdf")
}

#' @rdname generic_distribution_functions
#' @export
logpdf <- function(x, ...) {
  UseMethod("logpdf")
}

#' @rdname generic_distribution_functions
#' @export
hazard <- function(x, ...) {
  UseMethod("hazard")
}

#' @rdname generic_distribution_functions
#' @export
chf <- function(x, ...) {
  UseMethod("chf")
}

#' @rdname generic_distribution_functions
#' @export
mode <- function(x, ...) {
  UseMethod("mode")
}

#' @rdname generic_distribution_functions
#' @export
standard_deviation <- function(x, ...) {
  UseMethod("standard_deviation")
}

#' @rdname generic_distribution_functions
#' @export
support <- function(x, ...) {
  UseMethod("support")
}

#' @rdname generic_distribution_functions
#' @export
variance <- function(x, ...) {
  UseMethod("variance")
}

#' @rdname generic_distribution_functions
#' @export
skewness <- function(x, ...) {
  UseMethod("skewness")
}

#' @rdname generic_distribution_functions
#' @export
kurtosis <- function(x, ...) {
  UseMethod("kurtosis")
}

#' @rdname generic_distribution_functions
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

#' @exportS3Method base::mean boost_distribution
mean.boost_distribution <- function(x, ...) {
  dist_function("mean", x)
}

#' @exportS3Method stats::median boost_distribution
median.boost_distribution <- function(x, ...) {
  dist_function("median", x)
}

#' @exportS3Method mode boost_distribution
mode.boost_distribution <- function(x, ...) {
  dist_function("mode", x)
}

#' @exportS3Method base::range boost_distribution
range.boost_distribution <- function(x, ...) {
  dist_function("range", x)
}

#' @exportS3Method stats::quantile boost_distribution
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
