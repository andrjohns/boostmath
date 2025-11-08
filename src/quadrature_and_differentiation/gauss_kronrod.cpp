#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/quadrature/gauss_kronrod.hpp>
#include <boost/preprocessor/iteration/local.hpp>

extern "C" {
  SEXP gauss_kronrod_(SEXP f_, SEXP a_, SEXP b_, SEXP points_, SEXP max_depth_, SEXP tol_) {
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double a = cpp11::as_cpp<double>(a_);
    const double b = cpp11::as_cpp<double>(b_);
    const size_t points = cpp11::as_cpp<size_t>(points_);
    const size_t max_depth = cpp11::as_cpp<size_t>(max_depth_);
    const double tol = cpp11::as_cpp<double>(tol_);

    const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

    switch (points) {
#define BOOST_PP_LOCAL_MACRO(n) \
      case n: \
        return cpp11::as_sexp(boost::math::quadrature::gauss_kronrod<double, n>::integrate(func, a, b, max_depth, tol));
#define BOOST_PP_LOCAL_LIMITS (1, 200)
#include BOOST_PP_LOCAL_ITERATE()
    default:
      cpp11::stop("Unsupported number of points for Gauss-Kronrod integration");
      return R_NilValue;
    }

    END_CPP11
  }
}
