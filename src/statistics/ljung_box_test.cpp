#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/statistics/ljung_box.hpp>
#include "../boostmath/macros.hpp"

TERNARY_BOOST_FUNCTION_NAMESPACE(statistics, ljung_box, std::vector<double>, int64_t, int64_t);
