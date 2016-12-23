# == Define: hbm::manage::resource
#
define hbm::manage::resource (
  $ensure  = 'present',
  $type    = undef,
  $value   = undef,
  $options = [],
  $members = [],
) {

  validate_re($ensure, [ '^present$', '^absent$' ],
    "hbm::manage::resource::${name}::ensure is invalid and does not match the regex.")

  validate_string($type)
  validate_string($value)
  validate_array($options)
  validate_array($members)

  hbm { $name:
    ensure   => $ensure,
    provider => 'resource',
    type     => $type,
    value    => $value,
    options  => $options,
    members  => $members,
  }
}
