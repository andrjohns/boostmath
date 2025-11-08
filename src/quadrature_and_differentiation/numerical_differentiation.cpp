#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/differentiation/finite_difference.hpp>
#include "../boostmath/sexp.hpp"

extern "C" {
  SEXP finite_difference_derivative_(SEXP f_, SEXP x_, SEXP order_) {
    using boost::math::differentiation::finite_difference_derivative;
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double x = cpp11::as_cpp<double>(x_);
    const size_t order = cpp11::as_cpp<size_t>(order_);

    const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

    switch (order) {
      case 1:
        return cpp11::as_sexp(finite_difference_derivative<decltype(func), double, 1>(func, x));
      case 2:
        return cpp11::as_sexp(finite_difference_derivative<decltype(func), double, 2>(func, x));
      case 4:
        return cpp11::as_sexp(finite_difference_derivative<decltype(func), double, 4>(func, x));
      case 6:
        return cpp11::as_sexp(finite_difference_derivative<decltype(func), double, 6>(func, x));
      case 8:
        return cpp11::as_sexp(finite_difference_derivative<decltype(func), double, 8>(func, x));
      default:
        return cpp11::as_sexp(finite_difference_derivative<decltype(func), double>(func, x));
    }

    END_CPP11
  }

  SEXP complex_step_derivative_(SEXP f_, SEXP x_) {
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double x = cpp11::as_cpp<double>(x_);

    const auto func = [&f](const std::complex<double>& x) {
      return boostmath::as_cpp<std::complex<double>>(f(boostmath::as_sexp(x)));
    };

    return cpp11::as_sexp(boost::math::differentiation::complex_step_derivative(func, x));
    END_CPP11
  }
}
