#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/interpolators/quintic_hermite.hpp>
#include "../boostmath/sexp.hpp"

extern "C" {
  SEXP quintic_hermite_init_(SEXP x_, SEXP y_, SEXP dydx_, SEXP dy2dx2_) {
    std::vector<double> x = boostmath::as_cpp<std::vector<double>>(x_);
    std::vector<double> y = boostmath::as_cpp<std::vector<double>>(y_);
    std::vector<double> dydx = boostmath::as_cpp<std::vector<double>>(dydx_);
    std::vector<double> dy2dx2 = boostmath::as_cpp<std::vector<double>>(dy2dx2_);

    using interpolator_t = boost::math::interpolators::quintic_hermite<std::vector<double>>;
    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(std::move(x), std::move(y), std::move(dydx), std::move(dy2dx2)));

    return ptr;
  }

  SEXP quintic_hermite_eval_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::quintic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->operator()(x));
  }

  SEXP quintic_hermite_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::quintic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->prime(x));
  }

  SEXP quintic_hermite_double_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::quintic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->double_prime(x));
  }

  SEXP quintic_hermite_push_back_(SEXP ptr_, SEXP x_, SEXP y_, SEXP dydx_, SEXP dy2dx2_) {
    cpp11::external_pointer<boost::math::interpolators::quintic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);
    double y = boostmath::as_cpp<double>(y_);
    double dydx = boostmath::as_cpp<double>(dydx_);
    double dy2dx2 = boostmath::as_cpp<double>(dy2dx2_);

    ptr->push_back(x, y, dydx, dy2dx2);

    return R_NilValue;
  }

  SEXP quintic_hermite_domain_(SEXP ptr_) {
    cpp11::external_pointer<boost::math::interpolators::quintic_hermite<std::vector<double>>> ptr(ptr_);

    return boostmath::as_sexp(ptr->domain());
  }

  SEXP cardinal_quintic_hermite_init_(SEXP y_, SEXP dydx_, SEXP dy2dx2_, SEXP x0_, SEXP dx_) {
    std::vector<double> y = boostmath::as_cpp<std::vector<double>>(y_);
    std::vector<double> dydx = boostmath::as_cpp<std::vector<double>>(dydx_);
    std::vector<double> dy2dx2 = boostmath::as_cpp<std::vector<double>>(dy2dx2_);
    double x0 = boostmath::as_cpp<double>(x0_);
    double dx = boostmath::as_cpp<double>(dx_);

    using interpolator_t = boost::math::interpolators::cardinal_quintic_hermite<std::vector<double>>;

    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(std::move(y), std::move(dydx), std::move(dy2dx2), x0, dx));

    return ptr;
  }

  SEXP cardinal_quintic_hermite_eval_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::cardinal_quintic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->operator()(x));
  }

  SEXP cardinal_quintic_hermite_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::cardinal_quintic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->prime(x));
  }

  SEXP cardinal_quintic_hermite_double_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::cardinal_quintic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->double_prime(x));
  }

  SEXP cardinal_quintic_hermite_domain_(SEXP ptr_) {
    cpp11::external_pointer<boost::math::interpolators::cardinal_quintic_hermite<std::vector<double>>> ptr(ptr_);

    return boostmath::as_sexp(ptr->domain());
  }
}
