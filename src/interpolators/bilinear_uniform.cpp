#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/interpolators/bilinear_uniform.hpp>
#include "../boostmath/sexp.hpp"

extern "C" {
  SEXP bilinear_uniform_init_(SEXP fieldData_, SEXP rows_, SEXP cols_, SEXP dx_, SEXP dy_, SEXP x0_, SEXP y0_) {
    std::vector<double> fieldData = boostmath::as_cpp<std::vector<double>>(fieldData_);
    size_t rows = boostmath::as_cpp<size_t>(rows_);
    size_t cols = boostmath::as_cpp<size_t>(cols_);
    double dx = boostmath::as_cpp<double>(dx_);
    double dy = boostmath::as_cpp<double>(dy_);
    double x0 = boostmath::as_cpp<double>(x0_);
    double y0 = boostmath::as_cpp<double>(y0_);

    using interpolator_t = boost::math::interpolators::bilinear_uniform<std::vector<double>>;
    cpp11::external_pointer<interpolator_t> ptr(new interpolator_t(std::move(fieldData), rows, cols, dx, dy, x0, y0));

    return ptr;
  }

  SEXP bilinear_uniform_eval_(SEXP ptr_, SEXP x_, SEXP y_) {
    cpp11::external_pointer<boost::math::interpolators::bilinear_uniform<std::vector<double>>> ptr(ptr_);
    double x = boostmath::as_cpp<double>(x_);
    double y = boostmath::as_cpp<double>(y_);

    return boostmath::as_sexp(ptr->operator()(x, y));
  }
}
