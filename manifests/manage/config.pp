# == Define: hbm::manage::config
#
define hbm::manage::config (
  $ensure  = 'present',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::config::${name}::ensure is invalid and does not match the regex.")

  hbm { $name:
    ensure   => $ensure,
    provider => 'config',
  }
}
