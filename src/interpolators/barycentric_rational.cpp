#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/interpolators/barycentric_rational.hpp>

extern "C" {
  SEXP barycentric_rational_init_(SEXP x_, SEXP y_, SEXP order_) {
    std::vector<double> x = cpp11::as_cpp<std::vector<double>>(x_);
    std::vector<double> y = cpp11::as_cpp<std::vector<double>>(y_);
    std::size_t order = cpp11::as_cpp<std::size_t>(order_);

    using interpolator_t = boost::math::interpolators::barycentric_rational<double>;

    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(std::move(x), std::move(y), order));

    return ptr;
  }

  SEXP barycentric_rational_eval_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::barycentric_rational<double>> ptr(ptr_);
    double x = cpp11::as_cpp<double>(x_);

    return cpp11::as_sexp(ptr->operator()(x));
  }

  SEXP barycentric_rational_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::barycentric_rational<double>> ptr(ptr_);
    double x = cpp11::as_cpp<double>(x_);

    return cpp11::as_sexp(ptr->prime(x));
  }
}
