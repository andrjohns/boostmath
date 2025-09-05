#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/tools/roots.hpp>

extern "C" {
  SEXP newton_raphson_iterate_(SEXP f_, SEXP guess_, SEXP min_, SEXP max_, SEXP digits_, SEXP max_iter_) {
    BEGIN_CPP11
    cpp11::function f(f_);
    double guess = cpp11::as_cpp<double>(guess_);
    double min = cpp11::as_cpp<double>(min_);
    double max = cpp11::as_cpp<double>(max_);
    int digits = cpp11::as_cpp<int>(digits_);
    std::uintmax_t max_iter = cpp11::as_cpp<std::uintmax_t>(max_iter_);

    auto func = [&f](double x) {
      std::vector<double> fx_dx = cpp11::as_cpp<std::vector<double>>(f(x));
      return std::make_pair(fx_dx[0], fx_dx[1]);
    };

    double root = boost::math::tools::newton_raphson_iterate(func, guess, min, max, digits, max_iter);
    cpp11::writable::doubles result;
    result.push_back(root);
    result.attr("iterations") = max_iter;
    return cpp11::as_sexp(result);
    END_CPP11
  }

  SEXP halley_iterate_(SEXP f_, SEXP guess_, SEXP min_, SEXP max_, SEXP digits_, SEXP max_iter_) {
    BEGIN_CPP11
    cpp11::function f(f_);
    double guess = cpp11::as_cpp<double>(guess_);
    double min = cpp11::as_cpp<double>(min_);
    double max = cpp11::as_cpp<double>(max_);
    int digits = cpp11::as_cpp<int>(digits_);
    std::uintmax_t max_iter = cpp11::as_cpp<std::uintmax_t>(max_iter_);

    auto func = [&f](double x) {
      std::vector<double> fx_dx = cpp11::as_cpp<std::vector<double>>(f(x));
      return std::make_tuple(fx_dx[0], fx_dx[1], fx_dx[2]);
    };

    double root = boost::math::tools::halley_iterate(func, guess, min, max, digits, max_iter);
    cpp11::writable::doubles result;
    result.push_back(root);
    result.attr("iterations") = max_iter;
    return cpp11::as_sexp(result);
    END_CPP11
  }

  SEXP schroder_iterate_(SEXP f_, SEXP guess_, SEXP min_, SEXP max_, SEXP digits_, SEXP max_iter_) {
    BEGIN_CPP11
    cpp11::function f(f_);
    double guess = cpp11::as_cpp<double>(guess_);
    double min = cpp11::as_cpp<double>(min_);
    double max = cpp11::as_cpp<double>(max_);
    int digits = cpp11::as_cpp<int>(digits_);
    std::uintmax_t max_iter = cpp11::as_cpp<std::uintmax_t>(max_iter_);

    auto func = [&f](double x) {
      std::vector<double> fx_dx = cpp11::as_cpp<std::vector<double>>(f(x));
      return std::make_tuple(fx_dx[0], fx_dx[1], fx_dx[2]);
    };

    double root = boost::math::tools::schroder_iterate(func, guess, min, max, digits, max_iter);
    cpp11::writable::doubles result;
    result.push_back(root);
    result.attr("iterations") = max_iter;
    return cpp11::as_sexp(result);
    END_CPP11
  }
}