#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/interpolators/bezier_polynomial.hpp>
#include "../boostmath/sexp.hpp"

extern "C" {
  SEXP bezier_polynomial_init_(SEXP control_points_) {
    std::vector<std::array<double, 3>> control_points = boostmath::as_cpp<std::vector<std::array<double, 3>>>(control_points_);

    using interpolator_t = boost::math::interpolators::bezier_polynomial<std::vector<std::array<double, 3>>>;

    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(std::move(control_points)));

    return ptr;
  }

  SEXP bezier_polynomial_eval_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::bezier_polynomial<std::vector<std::array<double, 3>>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->operator()(x));
  }

  SEXP bezier_polynomial_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::interpolators::bezier_polynomial<std::vector<std::array<double, 3>>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->prime(x));
  }

  SEXP bezier_polynomial_edit_control_point_(SEXP ptr_, SEXP p_, SEXP index_) {
    cpp11::external_pointer<boost::math::interpolators::bezier_polynomial<std::vector<std::array<double, 3>>>> ptr(ptr_);
    std::array<double, 3> p = boostmath::as_cpp<std::array<double, 3>>(p_);
    std::size_t index = boostmath::as_cpp<std::size_t>(index_);

    ptr->edit_control_point(p, index);

    return R_NilValue;
  }
}
