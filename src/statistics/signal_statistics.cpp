#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/statistics/signal_statistics.hpp>
#include "../boostmath/macros.hpp"

UNARY_BOOST_FUNCTION_NAMESPACE(statistics, absolute_gini_coefficient, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, sample_absolute_gini_coefficient, std::vector<double>);
UNARY_BOOST_FUNCTION_NAMESPACE(statistics, hoyer_sparsity, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, oracle_snr, std::vector<double>, std::vector<double>);
BINARY_BOOST_FUNCTION_NAMESPACE(statistics, oracle_snr_db, std::vector<double>, std::vector<double>);
TERNARY_BOOST_FUNCTION_NAMESPACE(statistics, m2m4_snr_estimator, std::vector<double>, double, double);
TERNARY_BOOST_FUNCTION_NAMESPACE(statistics, m2m4_snr_estimator_db, std::vector<double>, double, double);
