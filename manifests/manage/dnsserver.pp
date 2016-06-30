# == Define: hbm::manage::dnsserver
#
define hbm::manage::dnsserver (
  $ensure = 'present',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::dnsserver::${name}::ensure is invalid and does not match the regex.")

  hbm { $name:
    ensure   => $ensure,
    provider => 'dns',
  }
}
