#include <boost/math/special_functions/hypergeometric_1F0.hpp>
#include <boost/math/special_functions/hypergeometric_0F1.hpp>
#include <boost/math/special_functions/hypergeometric_2F0.hpp>
#include <boost/math/special_functions/hypergeometric_1F1.hpp>
#include <boost/math/special_functions/hypergeometric_pFq.hpp>
#include "../boostmath/macros.hpp"

BINARY_BOOST_FUNCTION(hypergeometric_1F0, double, double);
BINARY_BOOST_FUNCTION(hypergeometric_0F1, double, double);
TERNARY_BOOST_FUNCTION(hypergeometric_2F0, double, double, double);
TERNARY_BOOST_FUNCTION(hypergeometric_1F1, double, double, double);
TERNARY_BOOST_FUNCTION(hypergeometric_1F1_regularized, double, double, double);
TERNARY_BOOST_FUNCTION(hypergeometric_pFq, std::vector<double>, std::vector<double>, double);

extern "C" SEXP log_hypergeometric_1F1_(SEXP a_, SEXP b_, SEXP z_) {
  BEGIN_CPP11
  const double a = cpp11::as_cpp<double>(a_);
  const double b = cpp11::as_cpp<double>(b_);
  const double z = cpp11::as_cpp<double>(z_);
  int value_sign;
  cpp11::writable::doubles result;
  result.push_back(std::move(boost::math::log_hypergeometric_1F1(a, b, z, &value_sign)));
  result.attr("sign") = std::move(value_sign);

  return cpp11::as_sexp(result);
  END_CPP11
}
