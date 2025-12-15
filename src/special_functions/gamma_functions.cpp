#include <boost/math/special_functions/gamma.hpp>
#include <boost/math/special_functions/digamma.hpp>
#include <boost/math/special_functions/trigamma.hpp>
#include <boost/math/special_functions/polygamma.hpp>
#include "../boostmath/macros.hpp"

UNARY_BOOST_FUNCTION(tgamma, double);
UNARY_BOOST_FUNCTION(tgamma1pm1, double);
UNARY_BOOST_FUNCTION(lgamma, double);
UNARY_BOOST_FUNCTION(digamma, double);
UNARY_BOOST_FUNCTION(trigamma, double);
BINARY_BOOST_FUNCTION(polygamma, int, double);
BINARY_BOOST_FUNCTION(tgamma_ratio, double, double);
BINARY_BOOST_FUNCTION(tgamma_delta_ratio, double, double);
BINARY_BOOST_FUNCTION(gamma_p, double, double);
BINARY_BOOST_FUNCTION(gamma_q, double, double);
BINARY_BOOST_FUNCTION(tgamma_lower, double, double);
BINARY_BOOST_FUNCTION_SUFFIX(tgamma, upper_, double, double);
BINARY_BOOST_FUNCTION(gamma_q_inv, double, double);
BINARY_BOOST_FUNCTION(gamma_p_inv, double, double);
BINARY_BOOST_FUNCTION(gamma_q_inva, double, double);
BINARY_BOOST_FUNCTION(gamma_p_inva, double, double);
BINARY_BOOST_FUNCTION(gamma_p_derivative, double, double);
