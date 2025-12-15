#include <cpp11/declarations.hpp>
#include <boost/math/tools/roots.hpp>
#include "../boostmath/sexp.hpp"

extern "C" {
  SEXP newton_raphson_iterate_(SEXP f_, SEXP guess_, SEXP min_, SEXP max_, SEXP digits_, SEXP max_iter_) {
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double guess = cpp11::as_cpp<double>(guess_);
    const double min = cpp11::as_cpp<double>(min_);
    const double max = cpp11::as_cpp<double>(max_);
    const int digits = cpp11::as_cpp<int>(digits_);
    std::uintmax_t max_iter = cpp11::as_cpp<std::uintmax_t>(max_iter_);

    const auto func = [&f](const double x) {
      return boostmath::as_cpp<std::pair<double, double>>(f(x));
    };

    const double root = boost::math::tools::newton_raphson_iterate(func, guess, min, max, digits, max_iter);
    cpp11::writable::doubles result;
    result.push_back(std::move(root));
    result.attr("iterations") = std::move(max_iter);
    return cpp11::as_sexp(result);
    END_CPP11
  }

  SEXP halley_iterate_(SEXP f_, SEXP guess_, SEXP min_, SEXP max_, SEXP digits_, SEXP max_iter_) {
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double guess = cpp11::as_cpp<double>(guess_);
    const double min = cpp11::as_cpp<double>(min_);
    const double max = cpp11::as_cpp<double>(max_);
    const int digits = cpp11::as_cpp<int>(digits_);
    std::uintmax_t max_iter = cpp11::as_cpp<std::uintmax_t>(max_iter_);

    const auto func = [&f](const double x) {
      return boostmath::as_cpp<std::tuple<double, double, double>>(f(x));
    };

    const double root = boost::math::tools::halley_iterate(func, guess, min, max, digits, max_iter);
    cpp11::writable::doubles result;
    result.push_back(std::move(root));
    result.attr("iterations") = std::move(max_iter);
    return cpp11::as_sexp(result);
    END_CPP11
  }

  SEXP schroder_iterate_(SEXP f_, SEXP guess_, SEXP min_, SEXP max_, SEXP digits_, SEXP max_iter_) {
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double guess = cpp11::as_cpp<double>(guess_);
    const double min = cpp11::as_cpp<double>(min_);
    const double max = cpp11::as_cpp<double>(max_);
    const int digits = cpp11::as_cpp<int>(digits_);
    std::uintmax_t max_iter = cpp11::as_cpp<std::uintmax_t>(max_iter_);

    const auto func = [&f](const double x) {
      return boostmath::as_cpp<std::tuple<double, double, double>>(f(x));
    };

    const double root = boost::math::tools::schroder_iterate(func, guess, min, max, digits, max_iter);
    cpp11::writable::doubles result;
    result.push_back(std::move(root));
    result.attr("iterations") = std::move(max_iter);
    return cpp11::as_sexp(result);
    END_CPP11
  }
}