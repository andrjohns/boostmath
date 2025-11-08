#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/quadrature/gauss.hpp>
#include <boost/preprocessor/iteration/local.hpp>

extern "C" {
  SEXP gauss_legendre_(SEXP f_, SEXP a_, SEXP b_, SEXP points_) {
    BEGIN_CPP11
    const cpp11::function f(f_);
    const double a = cpp11::as_cpp<double>(a_);
    const double b = cpp11::as_cpp<double>(b_);
    const size_t points = cpp11::as_cpp<size_t>(points_);

    const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

    switch (points) {
#define BOOST_PP_LOCAL_MACRO(n) \
      case n: \
        return cpp11::as_sexp(boost::math::quadrature::gauss<double, n>::integrate(func, a, b));
#define BOOST_PP_LOCAL_LIMITS (1, 200)
#include BOOST_PP_LOCAL_ITERATE()
    default:
      cpp11::stop("Unsupported number of points for Gauss-Legendre integration");
      return R_NilValue;
    }

    END_CPP11
  }
}
