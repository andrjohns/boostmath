#include <cpp11/declarations.hpp>
#include <boost/math/tools/roots.hpp>

extern "C" {
  SEXP bisect_(SEXP f_, SEXP a_, SEXP b_, SEXP digits_, SEXP max_iter_) {
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double a = cpp11::as_cpp<double>(a_);
    const double b = cpp11::as_cpp<double>(b_);
    const double digits = cpp11::as_cpp<int>(digits_);
    std::uintmax_t max_iter = cpp11::as_cpp<std::uintmax_t>(max_iter_);

    const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

    const boost::math::tools::eps_tolerance<double> tol(digits);

    const std::pair<double, double> roots = boost::math::tools::bisect(func, a, b, tol, max_iter);
    using cpp11::literals::operator""_nm;
    cpp11::writable::list result;
    result.push_back({"lower"_nm = std::move(roots.first)});
    result.push_back({"upper"_nm = std::move(roots.second)});
    result.push_back({"iterations"_nm = std::move(max_iter)});
    return cpp11::as_sexp(result);
    END_CPP11
  }

  SEXP bracket_and_solve_root_(SEXP f_, SEXP guess_, SEXP factor_, SEXP rising_, SEXP digits_, SEXP max_iter_) {
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double guess = cpp11::as_cpp<double>(guess_);
    const double factor = cpp11::as_cpp<double>(factor_);
    const bool rising = cpp11::as_cpp<bool>(rising_);
    const double digits = cpp11::as_cpp<int>(digits_);
    std::uintmax_t max_iter = cpp11::as_cpp<std::uintmax_t>(max_iter_);

    const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

    const boost::math::tools::eps_tolerance<double> tol(digits);

    const std::pair<double, double> roots = boost::math::tools::bracket_and_solve_root(func, guess, factor, rising, tol, max_iter);
    using cpp11::literals::operator""_nm;
    cpp11::writable::list result;
    result.push_back({"lower"_nm = std::move(roots.first)});
    result.push_back({"upper"_nm = std::move(roots.second)});
    result.push_back({"iterations"_nm = std::move(max_iter)});
    return cpp11::as_sexp(result);
    END_CPP11
  }

  SEXP toms748_solve_(SEXP f_, SEXP a_, SEXP b_, SEXP digits_, SEXP max_iter_) {
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double a = cpp11::as_cpp<double>(a_);
    const double b = cpp11::as_cpp<double>(b_);
    const double digits = cpp11::as_cpp<int>(digits_);
    std::uintmax_t max_iter = cpp11::as_cpp<std::uintmax_t>(max_iter_);

    const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

    const boost::math::tools::eps_tolerance<double> tol(digits);

    const std::pair<double, double> roots = boost::math::tools::toms748_solve(func, a, b, tol, max_iter);
    using cpp11::literals::operator""_nm;
    cpp11::writable::list result;
    result.push_back({"lower"_nm = std::move(roots.first)});
    result.push_back({"upper"_nm = std::move(roots.second)});
    result.push_back({"iterations"_nm = std::move(max_iter)});
    return cpp11::as_sexp(result);
    END_CPP11
  }
}
