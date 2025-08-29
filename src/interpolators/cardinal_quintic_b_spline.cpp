#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/interpolators/cardinal_quintic_b_spline.hpp>
#include "../boostmath/sexp.hpp"

extern "C" {
  SEXP cardinal_quintic_b_spline_init_(SEXP y_, SEXP t0_, SEXP h_,
                                      SEXP left_endpoint_derivatives_,
                                      SEXP right_endpoint_derivatives_) {
    std::vector<double> y = cpp11::as_cpp<std::vector<double>>(y_);
    double x0 = cpp11::as_cpp<double>(t0_);
    double h = cpp11::as_cpp<double>(h_);
    std::pair<double, double> left_endpoint_derivatives = boostmath::as_cpp<std::pair<double, double>>(left_endpoint_derivatives_);
    std::pair<double, double> right_endpoint_derivatives = boostmath::as_cpp<std::pair<double, double>>(right_endpoint_derivatives_);

    using interpolator_t = boost::math::interpolators::cardinal_quintic_b_spline<double>;

    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(y, x0, h, left_endpoint_derivatives, right_endpoint_derivatives));

    return ptr;
  }

  SEXP cardinal_quintic_b_spline_eval_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::cardinal_quintic_b_spline<double>> ptr(ptr_);
    double x = cpp11::as_cpp<double>(x_);

    return cpp11::as_sexp(ptr->operator()(x));
  }

  SEXP cardinal_quintic_b_spline_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::cardinal_quintic_b_spline<double>> ptr(ptr_);
    double x = cpp11::as_cpp<double>(x_);

    return cpp11::as_sexp(ptr->prime(x));
  }

  SEXP cardinal_quintic_b_spline_double_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::cardinal_quintic_b_spline<double>> ptr(ptr_);
    double x = cpp11::as_cpp<double>(x_);

    return cpp11::as_sexp(ptr->double_prime(x));
  }
}
