# == Define: hbm::manage::host
#
define hbm::manage::host (
  $ensure  = 'present',
  $members = [],
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::host::${name}::ensure is invalid and does not match the regex.")

  validate_array($members)

  hbm { $name:
    ensure   => $ensure,
    provider => 'host',
    members  => $members,
  }
}
