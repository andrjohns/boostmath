% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exponential_distribution.R
\name{exponential_distribution}
\alias{exponential_distribution}
\alias{exponential_pdf}
\alias{exponential_lpdf}
\alias{exponential_cdf}
\alias{exponential_lcdf}
\alias{exponential_quantile}
\title{Exponential Distribution Functions}
\usage{
exponential_pdf(x, lambda)

exponential_lpdf(x, lambda)

exponential_cdf(x, lambda)

exponential_lcdf(x, lambda)

exponential_quantile(p, lambda)
}
\arguments{
\item{x}{quantile}

\item{lambda}{rate parameter (lambda > 0)}

\item{p}{probability (0 <= p <= 1)}
}
\value{
A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
}
\description{
Functions to compute the probability density function, cumulative distribution function, and quantile function for the Exponential distribution.
}
\examples{
# Exponential distribution with rate parameter lambda = 2
exponential_pdf(1, 2)
exponential_lpdf(1, 2)
exponential_cdf(1, 2)
exponential_lcdf(1, 2)
exponential_quantile(0.5, 2)
}
\seealso{
\href{https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/exp_dist.html}{Boost Documentation} for more details on the mathematical background.
}
