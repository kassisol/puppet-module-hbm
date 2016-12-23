# == Define: hbm::manage::cluster
#
define hbm::manage::cluster (
  $ensure = 'present',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::cluster::${name}::ensure is invalid and does not match the regex.")

  hbm { $name:
    ensure   => $ensure,
    provider => 'cluster',
  }
}
