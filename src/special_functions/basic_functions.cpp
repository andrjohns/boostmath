#include <boost/math/special_functions/sin_pi.hpp>
#include <boost/math/special_functions/cos_pi.hpp>
#include <boost/math/special_functions/log1p.hpp>
#include <boost/math/special_functions/expm1.hpp>
#include <boost/math/special_functions/cbrt.hpp>
#include <boost/math/special_functions/sqrt1pm1.hpp>
#include <boost/math/special_functions/powm1.hpp>
#include <boost/math/special_functions/hypot.hpp>
#include <boost/math/special_functions/rsqrt.hpp>
#include "../boostmath/macros.hpp"

UNARY_BOOST_FUNCTION(sin_pi, double);
UNARY_BOOST_FUNCTION(cos_pi, double);
UNARY_BOOST_FUNCTION(log1p, double);
UNARY_BOOST_FUNCTION(expm1, double);
UNARY_BOOST_FUNCTION(cbrt, double);
UNARY_BOOST_FUNCTION(sqrt1pm1, double);
BINARY_BOOST_FUNCTION(powm1, double, double);
BINARY_BOOST_FUNCTION(hypot, double, double);
UNARY_BOOST_FUNCTION(rsqrt, double);
