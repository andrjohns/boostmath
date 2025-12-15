#include <boost/math/special_functions/legendre.hpp>
#include <boost/math/special_functions/laguerre.hpp>
#include <boost/math/special_functions/hermite.hpp>
#include <boost/math/special_functions/chebyshev.hpp>
#include <boost/math/special_functions/spherical_harmonic.hpp>
#include <boost/math/special_functions/gegenbauer.hpp>
#include <boost/math/special_functions/jacobi.hpp>
#include "../boostmath/macros.hpp"

BINARY_BOOST_FUNCTION(legendre_p, uint64_t, double);
BINARY_BOOST_FUNCTION(legendre_p_prime, uint64_t, double);
UNARY_BOOST_FUNCTION(legendre_p_zeros, int);
TERNARY_BOOST_FUNCTION_SUFFIX(legendre_p, m_, uint64_t, uint64_t, double);
BINARY_BOOST_FUNCTION(legendre_q, uint64_t, double);
QUARTERNARY_BOOST_FUNCTION(legendre_next, int, double, double, double);
BINARY_BOOST_FUNCTION(laguerre, uint64_t, double);
TERNARY_BOOST_FUNCTION_SUFFIX(laguerre, m_, uint64_t, uint64_t, double);
QUARTERNARY_BOOST_FUNCTION(laguerre_next, uint64_t, double, double, double);
BINARY_BOOST_FUNCTION(hermite, uint64_t, double);
QUARTERNARY_BOOST_FUNCTION(hermite_next, uint64_t, double, double, double);
TERNARY_BOOST_FUNCTION(chebyshev_next, double, double, double);
BINARY_BOOST_FUNCTION(chebyshev_t, uint64_t, double);
BINARY_BOOST_FUNCTION(chebyshev_u, uint64_t, double);
BINARY_BOOST_FUNCTION(chebyshev_t_prime, uint64_t, double);
QUARTERNARY_BOOST_FUNCTION(spherical_harmonic, uint64_t, int, double, double);
QUARTERNARY_BOOST_FUNCTION(spherical_harmonic_r, uint64_t, int, double, double);
QUARTERNARY_BOOST_FUNCTION(spherical_harmonic_i, uint64_t, int, double, double);
TERNARY_BOOST_FUNCTION(gegenbauer, uint64_t, double, double);
TERNARY_BOOST_FUNCTION(gegenbauer_prime, uint64_t, double, double);
QUARTERNARY_BOOST_FUNCTION(gegenbauer_derivative, uint64_t, double, double, uint64_t);
QUARTERNARY_BOOST_FUNCTION(jacobi, uint64_t, double, double, double);
QUARTERNARY_BOOST_FUNCTION(jacobi_prime, uint64_t, double, double, double);
QUARTERNARY_BOOST_FUNCTION(jacobi_double_prime, uint64_t, double, double, double);


extern "C" {
  SEXP chebyshev_clenshaw_recurrence_(SEXP c_, SEXP x_) {
    BEGIN_CPP11
    const std::vector<double> c = cpp11::as_cpp<std::vector<double>>(c_);
    const double x = cpp11::as_cpp<double>(x_);
    const double result = boost::math::chebyshev_clenshaw_recurrence(c.data(), c.size(), x);
    return cpp11::as_sexp(std::move(result));
    END_CPP11
  }

  SEXP chebyshev_clenshaw_recurrence_ab_(SEXP c_, SEXP a_, SEXP b_, SEXP x_) {
    BEGIN_CPP11
    const std::vector<double> c = cpp11::as_cpp<std::vector<double>>(c_);
    const double a = cpp11::as_cpp<double>(a_);
    const double b = cpp11::as_cpp<double>(b_);
    const double x = cpp11::as_cpp<double>(x_);
    const double result = boost::math::chebyshev_clenshaw_recurrence(c.data(), c.size(), a, b, x);
    return cpp11::as_sexp(std::move(result));
    END_CPP11
  }

  SEXP jacobi_derivative_(SEXP n_, SEXP alpha_, SEXP beta_, SEXP x_, SEXP k_) {
    BEGIN_CPP11
    const uint64_t n = cpp11::as_cpp<uint64_t>(n_);
    const double alpha = cpp11::as_cpp<double>(alpha_);
    const double beta = cpp11::as_cpp<double>(beta_);
    const double x = cpp11::as_cpp<double>(x_);
    const uint64_t k = cpp11::as_cpp<uint64_t>(k_);
    const double result = boost::math::jacobi_derivative(n, alpha, beta, x, k);
    return cpp11::as_sexp(std::move(result));
    END_CPP11
  }

  SEXP legendre_next_m_(SEXP l_, SEXP m_, SEXP x_, SEXP Pl_, SEXP Plm1_) {
    BEGIN_CPP11
    const int l = cpp11::as_cpp<int>(l_);
    const uint64_t m = cpp11::as_cpp<uint64_t>(m_);
    const double x = cpp11::as_cpp<double>(x_);
    const double Pl = cpp11::as_cpp<double>(Pl_);
    const double Plm1 = cpp11::as_cpp<double>(Plm1_);
    const double result = boost::math::legendre_next(l, m, x, Pl, Plm1);
    return cpp11::as_sexp(std::move(result));
    END_CPP11
  }

  SEXP laguerre_next_m_(SEXP n_, SEXP m_, SEXP x_, SEXP Ln_, SEXP Lnm1_) {
    BEGIN_CPP11
    const uint64_t n = cpp11::as_cpp<uint64_t>(n_);
    const uint64_t m = cpp11::as_cpp<uint64_t>(m_);
    const double x = cpp11::as_cpp<double>(x_);
    const double Ln = cpp11::as_cpp<double>(Ln_);
    const double Lnm1 = cpp11::as_cpp<double>(Lnm1_);
    const double result = boost::math::laguerre_next(n, m, x, Ln, Lnm1);
    return cpp11::as_sexp(std::move(result));
    END_CPP11
  }
}
