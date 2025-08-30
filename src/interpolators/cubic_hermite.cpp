#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/interpolators/cubic_hermite.hpp>
#include "../boostmath/sexp.hpp"

extern "C" {
  SEXP cubic_hermite_init_(SEXP abscissas_, SEXP ordinates_, SEXP derivatives_) {
    std::vector<double> abscissas = boostmath::as_cpp<std::vector<double>>(abscissas_);
    std::vector<double> ordinates = boostmath::as_cpp<std::vector<double>>(ordinates_);
    std::vector<double> derivatives = boostmath::as_cpp<std::vector<double>>(derivatives_);

    using interpolator_t = boost::math::interpolators::cubic_hermite<std::vector<double>>;

    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(std::move(abscissas), std::move(ordinates), std::move(derivatives)));

    return ptr;
  }

  SEXP cubic_hermite_eval_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::cubic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->operator()(x));
  }

  SEXP cubic_hermite_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::cubic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->prime(x));
  }

  SEXP cubic_hermite_push_back_(SEXP ptr_, SEXP x_, SEXP y_, SEXP dydx_) {
    cpp11::external_pointer<boost::math::interpolators::cubic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);
    double y = boostmath::as_cpp<double>(y_);
    double dydx = boostmath::as_cpp<double>(dydx_);

    ptr->push_back(x, y, dydx);

    return R_NilValue;
  }

  SEXP cubic_hermite_domain_(SEXP ptr_) {
    cpp11::external_pointer<boost::math::interpolators::cubic_hermite<std::vector<double>>> ptr(ptr_);

    return boostmath::as_sexp(ptr->domain());
  }

  SEXP cardinal_cubic_hermite_init_(SEXP y_, SEXP dydx_, SEXP x0_, SEXP dx_) {
    std::vector<double> y = boostmath::as_cpp<std::vector<double>>(y_);
    std::vector<double> dydx = boostmath::as_cpp<std::vector<double>>(dydx_);
    double x0 = boostmath::as_cpp<double>(x0_);
    double dx = boostmath::as_cpp<double>(dx_);

    using interpolator_t = boost::math::interpolators::cardinal_cubic_hermite<std::vector<double>>;

    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(std::move(y), std::move(dydx), x0, dx));

    return ptr;
  }

  SEXP cardinal_cubic_hermite_eval_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::cardinal_cubic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->operator()(x));
  }

  SEXP cardinal_cubic_hermite_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::cardinal_cubic_hermite<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->prime(x));
  }

  SEXP cardinal_cubic_hermite_domain_(SEXP ptr_) {
    cpp11::external_pointer<boost::math::interpolators::cardinal_cubic_hermite<std::vector<double>>> ptr(ptr_);

    return boostmath::as_sexp(ptr->domain());
  }
}
