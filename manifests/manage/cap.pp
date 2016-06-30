# == Define: hbm::manage::cap
#
define hbm::manage::cap (
  $ensure = 'present',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::cap::${name}::ensure is invalid and does not match the regex.")

  hbm { $name:
    ensure   => $ensure,
    provider => 'cap',
  }
}
