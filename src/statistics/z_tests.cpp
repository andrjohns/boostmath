#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/statistics/z_test.hpp>
#include "../boostmath/macros.hpp"

QUARTERNARY_BOOST_FUNCTION_NAMESPACE_SUFFIX(statistics, one_sample_z_test, params_, double, double, double, double);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, one_sample_z_test, std::vector<double>, double);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, two_sample_z_test, std::vector<double>, std::vector<double>);
