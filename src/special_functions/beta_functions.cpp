#include <boost/math/special_functions/beta.hpp>
#include "../boostmath/macros.hpp"

BINARY_BOOST_FUNCTION(beta, double, double);
TERNARY_BOOST_FUNCTION(ibeta, double, double, double);
TERNARY_BOOST_FUNCTION(ibetac, double, double, double);
TERNARY_BOOST_FUNCTION_SUFFIX(beta, incomplete_, double, double, double);
TERNARY_BOOST_FUNCTION(betac, double, double, double);
TERNARY_BOOST_FUNCTION(ibeta_inv, double, double, double);
TERNARY_BOOST_FUNCTION(ibetac_inv, double, double, double);
TERNARY_BOOST_FUNCTION(ibeta_inva, double, double, double);
TERNARY_BOOST_FUNCTION(ibetac_inva, double, double, double);
TERNARY_BOOST_FUNCTION(ibeta_invb, double, double, double);
TERNARY_BOOST_FUNCTION(ibetac_invb, double, double, double);
TERNARY_BOOST_FUNCTION(ibeta_derivative, double, double, double);
