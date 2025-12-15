#include <boost/math/tools/cubic_roots.hpp>
#include <boost/math/tools/quartic_roots.hpp>
#include <boost/math/tools/roots.hpp>
#include "../boostmath/macros.hpp"

TERNARY_BOOST_FUNCTION_NAMESPACE(tools, quadratic_roots, double, double, double);

QUARTERNARY_BOOST_FUNCTION_NAMESPACE(tools, cubic_roots, double, double, double, double);
PENTA_BOOST_FUNCTION_NAMESPACE(tools, cubic_root_residual, double, double, double, double, double);
PENTA_BOOST_FUNCTION_NAMESPACE(tools, cubic_root_condition_number, double, double, double, double, double);

PENTA_BOOST_FUNCTION_NAMESPACE(tools, quartic_roots, double, double, double, double, double);

