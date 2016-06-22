# == Define: hbm::manage::image
#
define hbm::manage::image (
  $ensure = 'present',
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::image::${name}::ensure is invalid and does not match the regex.")

  hbm { $name:
    provider => 'image',
    ensure   => $ensure,
  }
}
