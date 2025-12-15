#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/quadrature/ooura_fourier_integrals.hpp>

extern "C" {
  SEXP ooura_fourier_sin_(SEXP f_, SEXP omega_, SEXP relative_error_tolerance_, SEXP levels_) {
    std::pair<double, double> result_pair = {std::numeric_limits<double>::quiet_NaN(), std::numeric_limits<double>::quiet_NaN()};
    SEXP err = R_NilValue;
    char buf[8192] = "";
    try {
      const cpp11::function f(f_);
      const double omega = cpp11::as_cpp<double>(omega_);
      const double relative_error_tolerance = cpp11::as_cpp<double>(relative_error_tolerance_);
      const size_t levels = cpp11::as_cpp<size_t>(levels_);

      const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

      boost::math::quadrature::ooura_fourier_sin<double> integrator(relative_error_tolerance, levels);
      result_pair = integrator.integrate(func, omega);
    } catch (cpp11::unwind_exception & e) {
      err = e.token;
    } catch (std::exception & e) {
      strncpy(buf, e.what(), sizeof(buf) - 1);
    } catch (...) {
      strncpy(buf, "C++ error (unknown cause)", sizeof(buf) - 1);
    }

    if (buf[0] != '\0') {
      Rf_errorcall(R_NilValue, "%s", buf);
    } else if (err != R_NilValue) {
      R_ContinueUnwind(err);
    }
    cpp11::writable::doubles result;
    result.push_back(std::move(result_pair.first));
    result.attr("relative_error") = std::move(result_pair.second);
    return cpp11::as_sexp(result);
  }

  SEXP ooura_fourier_cos_(SEXP f_, SEXP omega_, SEXP relative_error_tolerance_, SEXP levels_) {
    std::pair<double, double> result_pair = {std::numeric_limits<double>::quiet_NaN(), std::numeric_limits<double>::quiet_NaN()};
    SEXP err = R_NilValue;
    char buf[8192] = "";
    try {
      const cpp11::function f(f_);
      const double omega = cpp11::as_cpp<double>(omega_);
      const double relative_error_tolerance = cpp11::as_cpp<double>(relative_error_tolerance_);
      const size_t levels = cpp11::as_cpp<size_t>(levels_);

      const auto func = [&f](const double x) { return cpp11::as_cpp<double>(f(x)); };

      boost::math::quadrature::ooura_fourier_cos<double> integrator(relative_error_tolerance, levels);
      result_pair = integrator.integrate(func, omega);
    } catch (cpp11::unwind_exception & e) {
      err = e.token;
    } catch (std::exception & e) {
      strncpy(buf, e.what(), sizeof(buf) - 1);
    } catch (...) {
      strncpy(buf, "C++ error (unknown cause)", sizeof(buf) - 1);
    }

    if (buf[0] != '\0') {
      Rf_errorcall(R_NilValue, "%s", buf);
    } else if (err != R_NilValue) {
      R_ContinueUnwind(err);
    }
    cpp11::writable::doubles result;  
    result.push_back(std::move(result_pair.first));
    result.attr("relative_error") = std::move(result_pair.second);
    return cpp11::as_sexp(result);
  }
}
