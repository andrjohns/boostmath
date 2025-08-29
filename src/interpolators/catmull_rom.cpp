#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/interpolators/catmull_rom.hpp>
#include "../boostmath/sexp.hpp"

extern "C" {
  SEXP catmull_rom_init_(SEXP points_, SEXP closed_, SEXP alpha_) {
    std::vector<std::array<double, 3>> points = boostmath::as_cpp<std::vector<std::array<double, 3>>>(points_);
    bool closed = boostmath::as_cpp<bool>(closed_);
    double alpha = boostmath::as_cpp<double>(alpha_);

    using interpolator_t = boost::math::catmull_rom<std::array<double, 3>>;

    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(std::move(points), closed, alpha));

    return ptr;
  }

  SEXP catmull_rom_eval_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::catmull_rom<std::array<double, 3>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->operator()(x));
  }

  SEXP catmull_rom_prime_(SEXP ptr_, SEXP x_) {
    cpp11::external_pointer<boost::math::catmull_rom<std::array<double, 3>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);

    return boostmath::as_sexp(ptr->prime(x));
  }

  SEXP catmull_rom_max_parameter_(SEXP ptr_) {
    cpp11::external_pointer<boost::math::catmull_rom<std::array<double, 3>>> ptr(ptr_);

    return boostmath::as_sexp(ptr->max_parameter());
  }

  SEXP catmull_rom_parameter_at_point_(SEXP ptr_, SEXP i_) {
    cpp11::external_pointer<boost::math::catmull_rom<std::array<double, 3>>> ptr(ptr_);
    size_t i = boostmath::as_cpp<size_t>(i_);

    return boostmath::as_sexp(ptr->parameter_at_point(i));
  }
}
