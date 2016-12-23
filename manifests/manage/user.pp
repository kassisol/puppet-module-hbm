# == Define: hbm::manage::user
#
define hbm::manage::user (
  $ensure  = 'present',
  $members = [],
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::user::${name}::ensure is invalid and does not match the regex.")

  validate_array($members)

  hbm { $name:
    ensure   => $ensure,
    provider => 'user',
    members  => $members,
  }
}
