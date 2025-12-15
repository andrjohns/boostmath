#include <cpp11.hpp>
#include <cpp11/declarations.hpp>
#include <boost/math/constants/constants.hpp>

extern "C" SEXP constants_() {
  BEGIN_CPP11
  using cpp11::literals::operator""_nm;
  
  cpp11::writable::list constants;
  constants.push_back({"half"_nm = boost::math::constants::half<double>()});
  constants.push_back({"third"_nm = boost::math::constants::third<double>()});
  constants.push_back({"twothirds"_nm = boost::math::constants::twothirds<double>()});
  constants.push_back({"two_thirds"_nm = boost::math::constants::two_thirds<double>()});
  constants.push_back({"sixth"_nm = boost::math::constants::sixth<double>()});
  constants.push_back({"three_quarters"_nm = boost::math::constants::three_quarters<double>()});
  constants.push_back({"root_two"_nm = boost::math::constants::root_two<double>()});
  constants.push_back({"root_three"_nm = boost::math::constants::root_three<double>()});
  constants.push_back({"half_root_two"_nm = boost::math::constants::half_root_two<double>()});
  constants.push_back({"ln_two"_nm = boost::math::constants::ln_two<double>()});
  constants.push_back({"ln_ln_two"_nm = boost::math::constants::ln_ln_two<double>()});
  constants.push_back({"root_ln_four"_nm = boost::math::constants::root_ln_four<double>()});
  constants.push_back({"one_div_root_two"_nm = boost::math::constants::one_div_root_two<double>()});
  constants.push_back({"pi"_nm = boost::math::constants::pi<double>()});
  constants.push_back({"half_pi"_nm = boost::math::constants::half_pi<double>()});
  constants.push_back({"third_pi"_nm = boost::math::constants::third_pi<double>()});
  constants.push_back({"sixth_pi"_nm = boost::math::constants::sixth_pi<double>()});
  constants.push_back({"two_pi"_nm = boost::math::constants::two_pi<double>()});
  constants.push_back({"two_thirds_pi"_nm = boost::math::constants::two_thirds_pi<double>()});
  constants.push_back({"three_quarters_pi"_nm = boost::math::constants::three_quarters_pi<double>()});
  constants.push_back({"four_thirds_pi"_nm = boost::math::constants::four_thirds_pi<double>()});
  constants.push_back({"one_div_two_pi"_nm = boost::math::constants::one_div_two_pi<double>()});
  constants.push_back({"one_div_root_two_pi"_nm = boost::math::constants::one_div_root_two_pi<double>()});
  constants.push_back({"log_pi"_nm = boost::math::constants::log_pi<double>()});
  constants.push_back({"root_pi"_nm = boost::math::constants::root_pi<double>()});
  constants.push_back({"root_half_pi"_nm = boost::math::constants::root_half_pi<double>()});
  constants.push_back({"root_two_pi"_nm = boost::math::constants::root_two_pi<double>()});
  constants.push_back({"log_root_two_pi"_nm = boost::math::constants::log_root_two_pi<double>()});
  constants.push_back({"one_div_root_pi"_nm = boost::math::constants::one_div_root_pi<double>()});
  constants.push_back({"root_one_div_pi"_nm = boost::math::constants::root_one_div_pi<double>()});
  constants.push_back({"pi_minus_three"_nm = boost::math::constants::pi_minus_three<double>()});
  constants.push_back({"four_minus_pi"_nm = boost::math::constants::four_minus_pi<double>()});
  constants.push_back({"pi_pow_e"_nm = boost::math::constants::pi_pow_e<double>()});
  constants.push_back({"pi_sqr"_nm = boost::math::constants::pi_sqr<double>()});
  constants.push_back({"pi_sqr_div_six"_nm = boost::math::constants::pi_sqr_div_six<double>()});
  constants.push_back({"pi_cubed"_nm = boost::math::constants::pi_cubed<double>()});
  constants.push_back({"cbrt_pi"_nm = boost::math::constants::cbrt_pi<double>()});
  constants.push_back({"one_div_cbrt_pi"_nm = boost::math::constants::one_div_cbrt_pi<double>()});
  constants.push_back({"log2_e"_nm = boost::math::constants::log2_e<double>()});
  constants.push_back({"e"_nm = boost::math::constants::e<double>()});
  constants.push_back({"exp_minus_half"_nm = boost::math::constants::exp_minus_half<double>()});
  constants.push_back({"exp_minus_one"_nm = boost::math::constants::exp_minus_one<double>()});
  constants.push_back({"e_pow_pi"_nm = boost::math::constants::e_pow_pi<double>()});
  constants.push_back({"root_e"_nm = boost::math::constants::root_e<double>()});
  constants.push_back({"log10_e"_nm = boost::math::constants::log10_e<double>()});
  constants.push_back({"one_div_log10_e"_nm = boost::math::constants::one_div_log10_e<double>()});
  constants.push_back({"ln_ten"_nm = boost::math::constants::ln_ten<double>()});
  constants.push_back({"degree"_nm = boost::math::constants::degree<double>()});
  constants.push_back({"radian"_nm = boost::math::constants::radian<double>()});
  constants.push_back({"sin_one"_nm = boost::math::constants::sin_one<double>()});
  constants.push_back({"cos_one"_nm = boost::math::constants::cos_one<double>()});
  constants.push_back({"sinh_one"_nm = boost::math::constants::sinh_one<double>()});
  constants.push_back({"cosh_one"_nm = boost::math::constants::cosh_one<double>()});
  constants.push_back({"phi"_nm = boost::math::constants::phi<double>()});
  constants.push_back({"ln_phi"_nm = boost::math::constants::ln_phi<double>()});
  constants.push_back({"one_div_ln_phi"_nm = boost::math::constants::one_div_ln_phi<double>()});
  constants.push_back({"euler"_nm = boost::math::constants::euler<double>()});
  constants.push_back({"one_div_euler"_nm = boost::math::constants::one_div_euler<double>()});
  constants.push_back({"euler_sqr"_nm = boost::math::constants::euler_sqr<double>()});
  constants.push_back({"zeta_two"_nm = boost::math::constants::zeta_two<double>()});
  constants.push_back({"zeta_three"_nm = boost::math::constants::zeta_three<double>()});
  constants.push_back({"catalan"_nm = boost::math::constants::catalan<double>()});
  constants.push_back({"glaisher"_nm = boost::math::constants::glaisher<double>()});
  constants.push_back({"khinchin"_nm = boost::math::constants::khinchin<double>()});
  constants.push_back({"extreme_value_skewness"_nm = boost::math::constants::extreme_value_skewness<double>()});
  constants.push_back({"rayleigh_skewness"_nm = boost::math::constants::rayleigh_skewness<double>()});
  constants.push_back({"rayleigh_kurtosis"_nm = boost::math::constants::rayleigh_kurtosis<double>()});
  constants.push_back({"rayleigh_kurtosis_excess"_nm = boost::math::constants::rayleigh_kurtosis_excess<double>()});
  constants.push_back({"two_div_pi"_nm = boost::math::constants::two_div_pi<double>()});
  constants.push_back({"root_two_div_pi"_nm = boost::math::constants::root_two_div_pi<double>()});
  constants.push_back({"quarter_pi"_nm = boost::math::constants::quarter_pi<double>()});
  constants.push_back({"one_div_pi"_nm = boost::math::constants::one_div_pi<double>()});
  constants.push_back({"two_div_root_pi"_nm = boost::math::constants::two_div_root_pi<double>()});
  constants.push_back({"first_feigenbaum"_nm = boost::math::constants::first_feigenbaum<double>()});
  constants.push_back({"plastic"_nm = boost::math::constants::plastic<double>()});
  constants.push_back({"gauss"_nm = boost::math::constants::gauss<double>()});
  constants.push_back({"dottie"_nm = boost::math::constants::dottie<double>()});
  constants.push_back({"reciprocal_fibonacci"_nm = boost::math::constants::reciprocal_fibonacci<double>()});
  constants.push_back({"laplace_limit"_nm = boost::math::constants::laplace_limit<double>()});
  return constants;

  END_CPP11
}
