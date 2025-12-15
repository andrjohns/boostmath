#include <boost/math/special_functions/ellint_rf.hpp>
#include <boost/math/special_functions/ellint_rd.hpp>
#include <boost/math/special_functions/ellint_rj.hpp>
#include <boost/math/special_functions/ellint_rc.hpp>
#include <boost/math/special_functions/ellint_rg.hpp>
#include <boost/math/special_functions/ellint_1.hpp>
#include <boost/math/special_functions/ellint_2.hpp>
#include <boost/math/special_functions/ellint_3.hpp>
#include <boost/math/special_functions/ellint_d.hpp>
#include <boost/math/special_functions/jacobi_zeta.hpp>
#include <boost/math/special_functions/heuman_lambda.hpp>
#include "../boostmath/macros.hpp"

TERNARY_BOOST_FUNCTION(ellint_rf, double, double, double);
TERNARY_BOOST_FUNCTION(ellint_rd, double, double, double);
BINARY_BOOST_FUNCTION(ellint_rc, double, double);
TERNARY_BOOST_FUNCTION(ellint_rg, double, double, double);
BINARY_BOOST_FUNCTION_SUFFIX(ellint_1, incomplete_, double, double);
UNARY_BOOST_FUNCTION(ellint_1, double);
BINARY_BOOST_FUNCTION_SUFFIX(ellint_2, incomplete_, double, double);
UNARY_BOOST_FUNCTION(ellint_2, double);
TERNARY_BOOST_FUNCTION_SUFFIX(ellint_3, incomplete_, double, double, double);
BINARY_BOOST_FUNCTION(ellint_3, double, double);
BINARY_BOOST_FUNCTION_SUFFIX(ellint_d, incomplete_, double, double);
UNARY_BOOST_FUNCTION(ellint_d, double);
BINARY_BOOST_FUNCTION(jacobi_zeta, double, double);
BINARY_BOOST_FUNCTION(heuman_lambda, double, double);
QUARTERNARY_BOOST_FUNCTION(ellint_rj, double, double, double, double);
