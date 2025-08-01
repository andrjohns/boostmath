% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/students_t_distribution.R
\name{students_t_distribution}
\alias{students_t_distribution}
\alias{students_t_pdf}
\alias{students_t_lpdf}
\alias{students_t_cdf}
\alias{students_t_lcdf}
\alias{students_t_quantile}
\title{Student's T Distribution Functions}
\usage{
students_t_pdf(x, df = 1)

students_t_lpdf(x, df = 1)

students_t_cdf(x, df = 1)

students_t_lcdf(x, df = 1)

students_t_quantile(p, df = 1)
}
\arguments{
\item{x}{quantile}

\item{df}{degrees of freedom (default is 1)}

\item{p}{probability (0 <= p <= 1)}
}
\value{
A single numeric value with the computed probability density, log-probability density, cumulative distribution, log-cumulative distribution, or quantile depending on the function called.
}
\description{
Functions to compute the probability density function, cumulative distribution function, and quantile function for the Student's t distribution.
}
\examples{
# Student's t distribution with 3 degrees of freedom
students_t_pdf(0, 3)
students_t_lpdf(0, 3)
students_t_cdf(0, 3)
students_t_lcdf(0, 3)
students_t_quantile(0.5, 3)
}
\seealso{
\href{https://www.boost.org/doc/libs/latest/libs/math/doc/html/math_toolkit/dist_ref/dists/students_t_dist.html}{Boost Documentation} for more details on the mathematical background.
}
