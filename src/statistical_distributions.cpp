#include <boost/math/distributions.hpp>
#include <boost/math/distributions/empirical_cumulative_distribution_function.hpp>
#include "boostmath/macros.hpp"

BINARY_DISTRIBUTION_BOOST(arcsine, double, double)
BINARY_DISTRIBUTION_BOOST(beta, double, double)
BINARY_DISTRIBUTION_BOOST(binomial, int, double)
BINARY_DISTRIBUTION_BOOST(cauchy, double, double)
UNARY_DISTRIBUTION_BOOST(chi_squared, double)
UNARY_DISTRIBUTION_BOOST(exponential, double)
BINARY_DISTRIBUTION_BOOST(extreme_value, double, double)
BINARY_DISTRIBUTION_BOOST(fisher_f, double, double)
BINARY_DISTRIBUTION_BOOST(gamma, double, double)
UNARY_DISTRIBUTION_BOOST(geometric, double)
BINARY_DISTRIBUTION_BOOST(holtsmark, double, double)
BINARY_DISTRIBUTION_BOOST(hyperexponential, std::vector<double>, std::vector<double>)
TERNARY_DISTRIBUTION_BOOST(hypergeometric, uint64_t, uint64_t, uint64_t)
BINARY_DISTRIBUTION_BOOST(inverse_chi_squared, double, double)
BINARY_DISTRIBUTION_BOOST(inverse_gamma, double, double)
BINARY_DISTRIBUTION_BOOST(inverse_gaussian, double, double)
UNARY_DISTRIBUTION_BOOST(kolmogorov_smirnov, int)
BINARY_DISTRIBUTION_BOOST(landau, double, double)
BINARY_DISTRIBUTION_BOOST(laplace, double, double)
BINARY_DISTRIBUTION_BOOST(logistic, double, double)
BINARY_DISTRIBUTION_BOOST(lognormal, double, double)
BINARY_DISTRIBUTION_BOOST(mapairy, double, double)
BINARY_DISTRIBUTION_BOOST(negative_binomial, double, double)
TERNARY_DISTRIBUTION_BOOST(non_central_beta, double, double, double)
BINARY_DISTRIBUTION_BOOST(non_central_chi_squared, double, double)
TERNARY_DISTRIBUTION_BOOST(non_central_f, double, double, double)
BINARY_DISTRIBUTION_BOOST(non_central_t, double, double)
BINARY_DISTRIBUTION_BOOST(normal, double, double)
BINARY_DISTRIBUTION_BOOST(pareto, double, double)
UNARY_DISTRIBUTION_BOOST(poisson, double)
UNARY_DISTRIBUTION_BOOST(rayleigh, double)
BINARY_DISTRIBUTION_BOOST(saspoint5, double, double)
TERNARY_DISTRIBUTION_BOOST(skew_normal, double, double, double)
UNARY_DISTRIBUTION_BOOST(students_t, double)
TERNARY_DISTRIBUTION_BOOST(triangular, double, double, double)
BINARY_DISTRIBUTION_BOOST(uniform, double, double)
BINARY_DISTRIBUTION_BOOST(weibull, double, double)

extern "C" {
  SEXP ecdf_create_(SEXP data_, SEXP sorted_) {
    BEGIN_CPP11
    using ecdf_t = boost::math::empirical_cumulative_distribution_function<std::vector<double>>;
    std::vector<double> data = boostmath::as_cpp<std::vector<double>>(data_);
    const bool sorted = boostmath::as_cpp<bool>(sorted_);
    cpp11::external_pointer<ecdf_t> ecdf_ptr(new ecdf_t(std::move(data), sorted));
    return ecdf_ptr;
    END_CPP11
  }

  SEXP ecdf_val_(SEXP ecdf_ptr_, SEXP x_) {
    BEGIN_CPP11
    using ecdf_t = boost::math::empirical_cumulative_distribution_function<std::vector<double>>;
    const cpp11::external_pointer<ecdf_t> ecdf_ptr(ecdf_ptr_);
    const double x = boostmath::as_cpp<double>(x_);
    return boostmath::as_sexp(ecdf_ptr->operator()(x));
    END_CPP11
  }
}
