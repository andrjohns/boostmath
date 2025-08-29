#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/interpolators/whittaker_shannon.hpp>

extern "C" {
  SEXP whittaker_shannon_init_(SEXP y_, SEXP t0_, SEXP h_) {
    std::vector<double> y = cpp11::as_cpp<std::vector<double>>(y_);
    double x0 = cpp11::as_cpp<double>(t0_);
    double h = cpp11::as_cpp<double>(h_);

    using interpolator_t = boost::math::interpolators::whittaker_shannon<std::vector<double>>;

    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(std::move(y), x0, h));

    return ptr;
  }

  SEXP whittaker_shannon_eval_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::whittaker_shannon<std::vector<double>>> ptr(ptr_);
    double x = cpp11::as_cpp<double>(x_);

    return cpp11::as_sexp(ptr->operator()(x));
  }

  SEXP whittaker_shannon_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::whittaker_shannon<std::vector<double>>> ptr(ptr_);
    double x = cpp11::as_cpp<double>(x_);

    return cpp11::as_sexp(ptr->prime(x));
  }
}
