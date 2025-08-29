#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/interpolators/pchip.hpp>
#include "../boostmath/sexp.hpp"

extern "C" {
  SEXP pchip_init_(SEXP abscissa_, SEXP ordinates_, SEXP left_endpoint_derivative_, SEXP right_endpoint_derivative_) {
    std::vector<double> abscissa = boostmath::as_cpp<std::vector<double>>(abscissa_);
    std::vector<double> ordinates = boostmath::as_cpp<std::vector<double>>(ordinates_);
    double left_endpoint_derivative = boostmath::as_cpp<double>(left_endpoint_derivative_);
    double right_endpoint_derivative = boostmath::as_cpp<double>(right_endpoint_derivative_);

    using interpolator_t = boost::math::interpolators::pchip<std::vector<double>>;

    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(std::move(abscissa), std::move(ordinates), left_endpoint_derivative, right_endpoint_derivative));

    return ptr;
  }

  SEXP pchip_eval_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::pchip<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->operator()(x));
  }

  SEXP pchip_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::pchip<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->prime(x));
  }

  SEXP pchip_push_back_(SEXP ptr_, SEXP x_, SEXP y_) {
    cpp11::external_pointer<boost::math::interpolators::pchip<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);
    double y = boostmath::as_cpp<double>(y_);

    ptr->push_back(x, y);

    return R_NilValue;
  }
}
