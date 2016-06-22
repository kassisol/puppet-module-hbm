# == Define: hbm::manage::volume
#
define hbm::manage::volume (
  $ensure  = 'present',
  $recurse = false,
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::volume::${name}::ensure is invalid and does not match the regex.")

  if is_string($recurse) {
    $recurse_real = str2bool($recurse)
  } else {
    $recurse_real = $recurse
  }
  validate_bool($recurse_real)

  hbm { $name:
    provider => 'volume',
    ensure   => $ensure,
    recurse  => $recurse_real,
  }
}
