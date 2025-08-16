#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/statistics/anderson_darling.hpp>
#include "../boostmath/macros.hpp"

TERNARY_BOOST_FUNCTION_NAMESPACE(statistics, anderson_darling_normality_statistic, std::vector<double>, double, double);
