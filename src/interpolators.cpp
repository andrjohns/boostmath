#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include "boostmath/macros.hpp"
#include <boost/math/interpolators/barycentric_rational.hpp>
#include <boost/math/interpolators/bezier_polynomial.hpp>
#include <boost/math/interpolators/bilinear_uniform.hpp>
#include <boost/math/interpolators/cardinal_cubic_b_spline.hpp>
#include <boost/math/interpolators/cardinal_quadratic_b_spline.hpp>
#include <boost/math/interpolators/cardinal_quintic_b_spline.hpp>
#include <boost/math/interpolators/catmull_rom.hpp>
#include <boost/math/interpolators/cubic_hermite.hpp>
#include <boost/math/interpolators/makima.hpp>
#include <boost/math/interpolators/pchip.hpp>
#include <boost/math/interpolators/quintic_hermite.hpp>
#include <boost/math/interpolators/whittaker_shannon.hpp>

POLYNOMIAL_TERNARY_INIT_BOOST(barycentric_rational, double, std::vector<double>, std::vector<double>, std::size_t)
POLYNOMIAL_UNARY_EVAL_BOOST(barycentric_rational, double, double)
POLYNOMIAL_UNARY_CALL_BOOST(barycentric_rational, prime, double, double)

POLYNOMIAL_UNARY_INIT_BOOST(bezier_polynomial, std::vector<std::array<double COMMA 3>>, std::vector<std::array<double COMMA 3>>)
POLYNOMIAL_UNARY_EVAL_BOOST(bezier_polynomial, std::vector<std::array<double COMMA 3>>, double)
POLYNOMIAL_UNARY_CALL_BOOST(bezier_polynomial, prime, std::vector<std::array<double COMMA 3>>, double)
POLYNOMIAL_BINARY_CALL_VOID_BOOST(bezier_polynomial, edit_control_point, std::vector<std::array<double COMMA 3>>, std::array<double COMMA 3>, std::size_t)

POLYNOMIAL_HEPTA_INIT_BOOST(bilinear_uniform, std::vector<double>, std::vector<double>, size_t, size_t, double, double, double, double)
POLYNOMIAL_BINARY_EVAL_BOOST(bilinear_uniform, std::vector<double>, double, double)

POLYNOMIAL_PENTA_INIT_ITER_BOOST(cardinal_cubic_b_spline, double, std::vector<double>, double, double, double, double)
POLYNOMIAL_UNARY_EVAL_BOOST(cardinal_cubic_b_spline, double, double)
POLYNOMIAL_UNARY_CALL_BOOST(cardinal_cubic_b_spline, prime, double, double)
POLYNOMIAL_UNARY_CALL_BOOST(cardinal_cubic_b_spline, double_prime, double, double)

POLYNOMIAL_PENTA_INIT_BOOST(cardinal_quadratic_b_spline, double, std::vector<double>, double, double, double, double)
POLYNOMIAL_UNARY_EVAL_BOOST(cardinal_quadratic_b_spline, double, double)
POLYNOMIAL_UNARY_CALL_BOOST(cardinal_quadratic_b_spline, prime, double, double)

POLYNOMIAL_PENTA_INIT_BOOST(cardinal_quintic_b_spline, double, std::vector<double>, double, double, std::pair<double COMMA double>, std::pair<double COMMA double>)
POLYNOMIAL_UNARY_EVAL_BOOST(cardinal_quintic_b_spline, double, double)
POLYNOMIAL_UNARY_CALL_BOOST(cardinal_quintic_b_spline, prime, double, double)
POLYNOMIAL_UNARY_CALL_BOOST(cardinal_quintic_b_spline, double_prime, double, double)

POLYNOMIAL_TERNARY_INIT_NOSPACE_BOOST(catmull_rom, std::array<double COMMA 3>, std::vector<std::array<double COMMA 3>>, bool, double)
POLYNOMIAL_UNARY_EVAL_NOSPACE_BOOST(catmull_rom, std::array<double COMMA 3>, double)
POLYNOMIAL_UNARY_CALL_NOSPACE_BOOST(catmull_rom, prime, std::array<double COMMA 3>, double)
POLYNOMIAL_NOARG_CALL_NOSPACE_BOOST(catmull_rom, max_parameter, std::array<double COMMA 3>)
POLYNOMIAL_UNARY_CALL_NOSPACE_BOOST(catmull_rom, parameter_at_point, std::array<double COMMA 3>, size_t)

POLYNOMIAL_TERNARY_INIT_BOOST(cubic_hermite, std::vector<double>, std::vector<double>, std::vector<double>, std::vector<double>)
POLYNOMIAL_UNARY_EVAL_BOOST(cubic_hermite, std::vector<double>, double)
POLYNOMIAL_UNARY_CALL_BOOST(cubic_hermite, prime, std::vector<double>, double)
POLYNOMIAL_TERNARY_CALL_VOID_BOOST(cubic_hermite, push_back, std::vector<double>, double, double, double)
POLYNOMIAL_NOARG_CALL_BOOST(cubic_hermite, domain, std::vector<double>)

POLYNOMIAL_QUARTERNARY_INIT_BOOST(cardinal_cubic_hermite, std::vector<double>, std::vector<double>, std::vector<double>, double, double)
POLYNOMIAL_UNARY_EVAL_BOOST(cardinal_cubic_hermite, std::vector<double>, double)
POLYNOMIAL_UNARY_CALL_BOOST(cardinal_cubic_hermite, prime, std::vector<double>, double)
POLYNOMIAL_NOARG_CALL_BOOST(cardinal_cubic_hermite, domain, std::vector<double>)

POLYNOMIAL_QUARTERNARY_INIT_BOOST(makima, std::vector<double>, std::vector<double>, std::vector<double>, double, double)
POLYNOMIAL_UNARY_EVAL_BOOST(makima, std::vector<double>, double)
POLYNOMIAL_UNARY_CALL_BOOST(makima, prime, std::vector<double>, double)
POLYNOMIAL_BINARY_CALL_VOID_BOOST(makima, push_back, std::vector<double>, double, double)

POLYNOMIAL_QUARTERNARY_INIT_BOOST(pchip, std::vector<double>, std::vector<double>, std::vector<double>, double, double)
POLYNOMIAL_UNARY_EVAL_BOOST(pchip, std::vector<double>, double)
POLYNOMIAL_UNARY_CALL_BOOST(pchip, prime, std::vector<double>, double)
POLYNOMIAL_BINARY_CALL_VOID_BOOST(pchip, push_back, std::vector<double>, double, double)

POLYNOMIAL_QUARTERNARY_INIT_BOOST(quintic_hermite, std::vector<double>, std::vector<double>, std::vector<double>, std::vector<double>, std::vector<double>)
POLYNOMIAL_UNARY_EVAL_BOOST(quintic_hermite, std::vector<double>, double)
POLYNOMIAL_UNARY_CALL_BOOST(quintic_hermite, prime, std::vector<double>, double)
POLYNOMIAL_UNARY_CALL_BOOST(quintic_hermite, double_prime, std::vector<double>, double)
POLYNOMIAL_QUARTERNARY_CALL_VOID_BOOST(quintic_hermite, push_back, std::vector<double>, double, double, double, double)
POLYNOMIAL_NOARG_CALL_BOOST(quintic_hermite, domain, std::vector<double>)

POLYNOMIAL_PENTA_INIT_BOOST(cardinal_quintic_hermite, std::vector<double>, std::vector<double>, std::vector<double>, std::vector<double>, double, double)
POLYNOMIAL_UNARY_EVAL_BOOST(cardinal_quintic_hermite, std::vector<double>, double)
POLYNOMIAL_UNARY_CALL_BOOST(cardinal_quintic_hermite, prime, std::vector<double>, double)
POLYNOMIAL_UNARY_CALL_BOOST(cardinal_quintic_hermite, double_prime, std::vector<double>, double)
POLYNOMIAL_NOARG_CALL_BOOST(cardinal_quintic_hermite, domain, std::vector<double>)

POLYNOMIAL_TERNARY_INIT_BOOST(whittaker_shannon, std::vector<double>, std::vector<double>, double, double)
POLYNOMIAL_UNARY_EVAL_BOOST(whittaker_shannon, std::vector<double>, double)
POLYNOMIAL_UNARY_CALL_BOOST(whittaker_shannon, prime, std::vector<double>, double)

