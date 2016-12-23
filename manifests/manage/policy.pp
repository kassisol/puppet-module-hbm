# == Define: hbm::manage::policy
#
define hbm::manage::policy (
  $ensure     = 'present',
  $cluster    = 'MANDATORY',
  $collection = 'MANDATORY',
  $group      = 'MANDATORY',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::policy::${name}::ensure is invalid and does not match the regex.")

  validate_string($cluster)
  validate_string($collection)
  validate_string($group)

  hbm { $name:
    ensure     => $ensure,
    provider   => 'policy',
    cluster    => $cluster,
    collection => $collection,
    group      => $group,
  }
}
