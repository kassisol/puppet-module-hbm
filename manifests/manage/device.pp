# == Define: hbm::manage::device
#
define hbm::manage::device (
  $ensure = 'present',
) {

  validate_re($ensure, [ '^present', '^absent$' ],
    "hbm::manage::device::${name}::ensure is invalid and does not match the regex.")

  hbm { $name:
    ensure   => $ensure,
    provider => 'device',
  }
}
