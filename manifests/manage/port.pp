# == Define: hbm::manage::port
#
define hbm::manage::port (
  $ensure = 'present',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::port::${name}::ensure is invalid and does not match the regex.")

  hbm { $name:
    ensure   => $ensure,
    provider => 'port',
  }
}
