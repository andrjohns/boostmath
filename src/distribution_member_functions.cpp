#include <boost/math/distributions.hpp>
#include "boostmath/macros.hpp"

BINARY_DISTRIBUTION_MEMBER_FUNCTION_SUFFIX(beta, find_alpha, meanvar_, double, double)
BINARY_DISTRIBUTION_MEMBER_FUNCTION_SUFFIX(beta, find_beta, meanvar_, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION_SUFFIX(beta, find_alpha, betax_, double, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION_SUFFIX(beta, find_beta, betax_, double, double, double)

extern "C" {
  SEXP binomial_find_lower_bound_on_p_(SEXP trials_, SEXP successes_, SEXP probability_, SEXP method_) {
    BEGIN_CPP11
    const uint64_t trials = boostmath::as_cpp<uint64_t>(trials_);
    const uint64_t successes = boostmath::as_cpp<uint64_t>(successes_);
    const double probability = boostmath::as_cpp<double>(probability_);
    const boost::math::binomial::interval_type method =
      boostmath::as_cpp<std::string>(method_) == "clopper_pearson_exact"
        ? boost::math::binomial_distribution<>::clopper_pearson_exact_interval
        : boost::math::binomial_distribution<>::jeffreys_prior_interval;
    const double result = boost::math::binomial_distribution<>::find_lower_bound_on_p(trials, successes, probability, method);
    return boostmath::as_sexp(std::move(result));
    END_CPP11
  }
  SEXP binomial_find_upper_bound_on_p_(SEXP trials_, SEXP successes_, SEXP probability_, SEXP method_) {
    BEGIN_CPP11
    const uint64_t trials = boostmath::as_cpp<uint64_t>(trials_);
    const uint64_t successes = boostmath::as_cpp<uint64_t>(successes_);
    const double probability = boostmath::as_cpp<double>(probability_);
    const boost::math::binomial::interval_type method =
      boostmath::as_cpp<std::string>(method_) == "clopper_pearson_exact"
        ? boost::math::binomial_distribution<>::clopper_pearson_exact_interval
        : boost::math::binomial_distribution<>::jeffreys_prior_interval;
    const double result = boost::math::binomial_distribution<>::find_upper_bound_on_p(trials, successes, probability, method);
    return boostmath::as_sexp(std::move(result));
    END_CPP11
  }
}

TERNARY_DISTRIBUTION_MEMBER_FUNCTION(binomial, find_minimum_number_of_trials, double, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION(binomial, find_maximum_number_of_trials, double, double, double)
PENTA_DISTRIBUTION_MEMBER_FUNCTION(chi_squared, find_degrees_of_freedom, double, double, double, double, double)
BINARY_DISTRIBUTION_MEMBER_FUNCTION(geometric, find_lower_bound_on_p, double, double)
BINARY_DISTRIBUTION_MEMBER_FUNCTION(geometric, find_upper_bound_on_p, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION(geometric, find_minimum_number_of_trials, double, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION(geometric, find_maximum_number_of_trials, double, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION(negative_binomial, find_lower_bound_on_p, double, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION(negative_binomial, find_upper_bound_on_p, double, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION(negative_binomial, find_minimum_number_of_trials, double, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION(negative_binomial, find_maximum_number_of_trials, double, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION(non_central_chi_squared, find_degrees_of_freedom, double, double, double)
TERNARY_DISTRIBUTION_MEMBER_FUNCTION(non_central_chi_squared, find_non_centrality, double, double, double)
PENTA_DISTRIBUTION_MEMBER_FUNCTION(students_t, find_degrees_of_freedom, double, double, double, double, double)
