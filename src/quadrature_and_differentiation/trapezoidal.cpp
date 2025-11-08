#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/quadrature/trapezoidal.hpp>

extern "C" {
  SEXP trapezoidal_(SEXP f_, SEXP a_, SEXP b_, SEXP tol_, SEXP max_refinements_) {
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double a = cpp11::as_cpp<double>(a_);
    const double b = cpp11::as_cpp<double>(b_);
    const double tol = cpp11::as_cpp<double>(tol_);
    const size_t max_refinements = cpp11::as_cpp<size_t>(max_refinements_);

    const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

    return cpp11::as_sexp(boost::math::quadrature::trapezoidal(func, a, b, tol, max_refinements));
    END_CPP11
  }
}
