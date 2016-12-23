# == Define: hbm::manage::collection
#
define hbm::manage::collection (
  $ensure = 'present',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::collection::${name}::ensure is invalid and does not match the regex.")

  hbm { $name:
    ensure   => $ensure,
    provider => 'collection',
  }
}
