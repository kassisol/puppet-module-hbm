# == Define: hbm::manage::group
#
define hbm::manage::group (
  $ensure = 'present',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::group::${name}::ensure is invalid and does not match the regex.")

  hbm { $name:
    ensure   => $ensure,
    provider => 'group',
  }
}
