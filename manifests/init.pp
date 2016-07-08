# == Class: hbm
#
# Module to manage HBM
#
class hbm (
  $manage_package         = false,
  $manage_service         = true,
  $service_enable         = true,
  $service_ensure         = 'running',
  $actions                = undef,
  $caps                   = undef,
  $configs                = undef,
  $devices                = undef,
  $dnsservers             = undef,
  $images                 = undef,
  $ports                  = undef,
  $registries             = undef,
  $volumes                = undef,
  $actions_hiera_merge    = false,
  $caps_hiera_merge       = false,
  $configs_hiera_merge    = false,
  $devices_hiera_merge    = false,
  $dnsservers_hiera_merge = false,
  $images_hiera_merge     = false,
  $ports_hiera_merge      = false,
  $registries_hiera_merge = false,
  $volumes_hiera_merge    = false,
) {

  if is_string($manage_package) {
    $manage_package_real = str2bool($manage_package)
  } else {
    $manage_package_real = $manage_package
  }
  validate_bool($manage_package_real)

  if is_string($manage_service) {
    $manage_service_real = str2bool($manage_service)
  } else {
    $manage_service_real = $manage_service
  }
  validate_bool($manage_service_real)

  if is_string($service_enable) {
    $service_enable_real = str2bool($service_enable)
  } else {
    $service_enable_real = $service_enable
  }
  validate_bool($service_enable_real)

  validate_re($service_ensure, [ '^running$', '^stopped$' ],
    'hbm::service_ensure is invalid and does not match the regex.')

  if is_string($actions_hiera_merge) {
    $actions_hiera_merge_real = str2bool($actions_hiera_merge)
  } else {
    $actions_hiera_merge_real = $actions_hiera_merge
  }
  validate_bool($actions_hiera_merge_real)

  if is_string($caps_hiera_merge) {
    $caps_hiera_merge_real = str2bool($caps_hiera_merge)
  } else {
    $caps_hiera_merge_real = $caps_hiera_merge
  }
  validate_bool($caps_hiera_merge_real)

  if is_string($configs_hiera_merge) {
    $configs_hiera_merge_real = str2bool($configs_hiera_merge)
  } else {
    $configs_hiera_merge_real = $configs_hiera_merge
  }
  validate_bool($configs_hiera_merge_real)

  if is_string($devices_hiera_merge) {
    $devices_hiera_merge_real = str2bool($devices_hiera_merge)
  } else {
    $devices_hiera_merge_real = $devices_hiera_merge
  }
  validate_bool($devices_hiera_merge_real)

  if is_string($dnsservers_hiera_merge) {
    $dnsservers_hiera_merge_real = str2bool($dnsservers_hiera_merge)
  } else {
    $dnsservers_hiera_merge_real = $dnsservers_hiera_merge
  }
  validate_bool($dnsservers_hiera_merge_real)

  if is_string($images_hiera_merge) {
    $images_hiera_merge_real = str2bool($images_hiera_merge)
  } else {
    $images_hiera_merge_real = $images_hiera_merge
  }
  validate_bool($images_hiera_merge_real)

  if is_string($ports_hiera_merge) {
    $ports_hiera_merge_real = str2bool($ports_hiera_merge)
  } else {
    $ports_hiera_merge_real = $ports_hiera_merge
  }
  validate_bool($ports_hiera_merge_real)

  if is_string($registries_hiera_merge) {
    $registries_hiera_merge_real = str2bool($registries_hiera_merge)
  } else {
    $registries_hiera_merge_real = $registries_hiera_merge
  }
  validate_bool($registries_hiera_merge_real)

  if is_string($volumes_hiera_merge) {
    $volumes_hiera_merge_real = str2bool($volumes_hiera_merge)
  } else {
    $volumes_hiera_merge_real = $volumes_hiera_merge
  }
  validate_bool($volumes_hiera_merge_real)

  if $manage_package_real {
    package { 'package_hbm':
      ensure => installed,
      name   => 'hbm',
    }
  }

  if $manage_service_real {
    service { 'service_hbm':
      ensure => $service_ensure,
      name   => 'hbm',
      enable => $service_enable_real,
    }
  }

  if $actions != undef {
    if $actions_hiera_merge_real == true {
      $actions_real = hiera_hash('hbm::actions')
    } else {
      $actions_real = $actions
    }
    validate_hash($actions_real)
    create_resources('hbm::manage::action', $actions_real)
  }

  if $caps != undef {
    if $caps_hiera_merge_real == true {
      $caps_real = hiera_hash('hbm::caps')
    } else {
      $caps_real = $caps
    }
    validate_hash($caps_real)
    create_resources('hbm::manage::cap', $caps_real)
  }

  if $configs != undef {
    if $configs_hiera_merge_real == true {
      $configs_real = hiera_hash('hbm::configs')
    } else {
      $configs_real = $configs
    }
    validate_hash($configs_real)
    create_resources('hbm::manage::config', $configs_real)
  }

  if $devices != undef {
    if $devices_hiera_merge_real == true {
      $devices_real = hiera_hash('hbm::devices')
    } else {
      $devices_real = $devices
    }
    validate_hash($devices_real)
    create_resources('hbm::manage::device', $devices_real)
  }

  if $dnsservers != undef {
    if $dnsservers_hiera_merge_real == true {
      $dnsservers_real = hiera_hash('hbm::dnsservers')
    } else {
      $dnsservers_real = $dnsservers
    }
    validate_hash($dnsservers_real)
    create_resources('hbm::manage::dnsserver', $dnsservers_real)
  }

  if $images != undef {
    if $images_hiera_merge_real == true {
      $images_real = hiera_hash('hbm::images')
    } else {
      $images_real = $images
    }
    validate_hash($images_real)
    create_resources('hbm::manage::image', $images_real)
  }

  if $ports != undef {
    if $ports_hiera_merge_real == true {
      $ports_real = hiera_hash('hbm::ports')
    } else {
      $ports_real = $ports
    }
    validate_hash($ports_real)
    create_resources('hbm::manage::port', $ports_real)
  }

  if $registries != undef {
    if $registries_hiera_merge_real == true {
      $registries_real = hiera_hash('hbm::registries')
    } else {
      $registries_real = $registries
    }
    validate_hash($registries_real)
    create_resources('hbm::manage::registry', $registries_real)
  }

  if $volumes != undef {
    if $volumes_hiera_merge_real == true {
      $volumes_real = hiera_hash('hbm::volumes')
    } else {
      $volumes_real = $volumes
    }
    validate_hash($volumes_real)
    create_resources('hbm::manage::volume', $volumes_real)
  }

  if $manage_package_real and $manage_service_real {
    Package['package_hbm'] -> Service['service_hbm']
  }
}
