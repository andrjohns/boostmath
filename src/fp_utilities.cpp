#include <boost/math/special_functions/next.hpp>
#include <boost/math/special_functions/ulp.hpp>
#include <boost/math/special_functions/relative_difference.hpp>
#include <boost/math/tools/condition_numbers.hpp>
#include "boostmath/macros.hpp"

UNARY_BOOST_FUNCTION(float_next, double)
UNARY_BOOST_FUNCTION(float_prior, double)
BINARY_BOOST_FUNCTION(float_distance, double, double)
BINARY_BOOST_FUNCTION(float_advance, double, int)
UNARY_BOOST_FUNCTION(ulp, double)
BINARY_BOOST_FUNCTION(relative_difference, double, double)
BINARY_BOOST_FUNCTION(epsilon_difference, double, double)

extern "C" SEXP summation_condition_number_(SEXP kahan_, SEXP x_) {
  BEGIN_CPP11
  using boost::math::tools::summation_condition_number;

  const double x = boostmath::as_cpp<double>(x_);
  const bool kahan = boostmath::as_cpp<bool>(kahan_);

  if (kahan) {
    cpp11::external_pointer<summation_condition_number<double, true>> ptr(new summation_condition_number<double, true>(x));
    return ptr;
  } else {
    cpp11::external_pointer<summation_condition_number<double, false>> ptr(new summation_condition_number<double, false>(x));
    return ptr;
  }
  END_CPP11
}

extern "C" SEXP summation_condition_number_op_(SEXP ptr_, SEXP kahan_, SEXP op_, SEXP x_) {
  BEGIN_CPP11
  using boost::math::tools::summation_condition_number;
  const bool kahan = boostmath::as_cpp<bool>(kahan_);
  const double x = boostmath::as_cpp<double>(x_);
  std::string op = boostmath::as_cpp<std::string>(op_);
  if (kahan) {
    cpp11::external_pointer<summation_condition_number<double, true>> ptr(ptr_);
    if (op == "add") {
      ptr->operator+=(x);
      return R_NilValue;
    } else if (op == "subtract") {
      ptr->operator-=(x);
      return R_NilValue;
    } else if (op == "sum") {
      return boostmath::as_sexp(ptr->sum());
    } else if (op == "l1_norm") {
      return boostmath::as_sexp(ptr->l1_norm());
    } else if (op == "condition_number") {
      return boostmath::as_sexp(ptr->operator()());
    } else {
      throw std::invalid_argument("Unsupported operation for summation_condition_number");
    }
  } else {
    cpp11::external_pointer<summation_condition_number<double, false>> ptr(ptr_);
    if (op == "add") {
      ptr->operator+=(x);
      return R_NilValue;
    } else if (op == "subtract") {
      ptr->operator-=(x);
      return R_NilValue;
    } else if (op == "sum") {
      return boostmath::as_sexp(ptr->sum());
    } else if (op == "l1_norm") {
      return boostmath::as_sexp(ptr->l1_norm());
    } else if (op == "condition_number") {
      return boostmath::as_sexp(ptr->operator()());
    } else {
      throw std::invalid_argument("Unsupported operation for summation_condition_number");
    }
  }
  END_CPP11
}

extern "C" SEXP evaluation_condition_number_(SEXP f_, SEXP x_) {
  BEGIN_CPP11
  using boost::math::tools::evaluation_condition_number;

  const cpp11::function f(f_);
  const double x = boostmath::as_cpp<double>(x_);

  const double cond_num = evaluation_condition_number(
    [&f](const double v) { return boostmath::as_cpp<double>(f(boostmath::as_sexp(v))); },
    x
  );
  return boostmath::as_sexp(cond_num);
  END_CPP11
}
