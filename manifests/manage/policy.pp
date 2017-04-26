# == Define: hbm::manage::policy
#
define hbm::manage::policy (
  $ensure     = 'present',
  $collection = 'MANDATORY',
  $group      = 'MANDATORY',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::policy::${name}::ensure is invalid and does not match the regex.")

  validate_string($collection)
  validate_string($group)

  hbm { $name:
    ensure     => $ensure,
    provider   => 'policy',
    collection => $collection,
    group      => $group,
  }
}
