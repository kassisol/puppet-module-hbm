# == Define: hbm::manage::action
#
define hbm::manage::action (
  $ensure = 'present',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::action::${name}::ensure is invalid and does not match the regex.")

  hbm { $name:
    provider => 'action',
    ensure   => $ensure,
  }
}
