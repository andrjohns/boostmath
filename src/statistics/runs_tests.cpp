#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/statistics/runs_test.hpp>
#include "../boostmath/macros.hpp"

BINARY_BOOST_FUNCTION_NAMESPACE(statistics, runs_above_and_below_threshold, std::vector<double>, double);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, runs_above_and_below_median, std::vector<double>);
