# == Class: hbm
#
# Module to manage HBM
#
class hbm (
  $manage_package          = false,
  $manage_service          = true,
  $service_enable          = true,
  $service_ensure          = 'running',
  $clusters                = undef,
  $collections             = undef,
  $configs                 = undef,
  $groups                  = undef,
  $hosts                   = undef,
  $policies                = undef,
  $resources               = undef,
  $users                   = undef,
  $clusters_hiera_merge    = false,
  $collections_hiera_merge = false,
  $configs_hiera_merge     = false,
  $groups_hiera_merge      = false,
  $hosts_hiera_merge       = false,
  $policies_hiera_merge    = false,
  $resources_hiera_merge   = false,
  $users_hiera_merge       = false,
) {

  $dockerversion = '1.12.0'

  if versioncmp($::docker_version, $dockerversion) < 0 {
      fail("HBM requires Docker Engine version >=${dockerversion}. Your version is ${::docker_version}.")
  }

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

  if is_string($clusters_hiera_merge) {
    $clusters_hiera_merge_real = str2bool($clusters_hiera_merge)
  } else {
    $clusters_hiera_merge_real = $clusters_hiera_merge
  }
  validate_bool($clusters_hiera_merge_real)

  if is_string($collections_hiera_merge) {
    $collections_hiera_merge_real = str2bool($collections_hiera_merge)
  } else {
    $collections_hiera_merge_real = $collections_hiera_merge
  }
  validate_bool($collections_hiera_merge_real)

  if is_string($configs_hiera_merge) {
    $configs_hiera_merge_real = str2bool($configs_hiera_merge)
  } else {
    $configs_hiera_merge_real = $configs_hiera_merge
  }
  validate_bool($configs_hiera_merge_real)

  if is_string($groups_hiera_merge) {
    $groups_hiera_merge_real = str2bool($groups_hiera_merge)
  } else {
    $groups_hiera_merge_real = $groups_hiera_merge
  }
  validate_bool($groups_hiera_merge_real)

  if is_string($hosts_hiera_merge) {
    $hosts_hiera_merge_real = str2bool($hosts_hiera_merge)
  } else {
    $hosts_hiera_merge_real = $hosts_hiera_merge
  }
  validate_bool($hosts_hiera_merge_real)

  if is_string($policies_hiera_merge) {
    $policies_hiera_merge_real = str2bool($policies_hiera_merge)
  } else {
    $policies_hiera_merge_real = $policies_hiera_merge
  }
  validate_bool($policies_hiera_merge_real)

  if is_string($resources_hiera_merge) {
    $resources_hiera_merge_real = str2bool($resources_hiera_merge)
  } else {
    $resources_hiera_merge_real = $resources_hiera_merge
  }
  validate_bool($resources_hiera_merge_real)

  if is_string($users_hiera_merge) {
    $users_hiera_merge_real = str2bool($users_hiera_merge)
  } else {
    $users_hiera_merge_real = $users_hiera_merge
  }
  validate_bool($users_hiera_merge_real)

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

  if $clusters != undef {
    if $clusters_hiera_merge_real == true {
      $clusters_real = hiera_hash('hbm::clusters')
    } else {
      $clusters_real = $clusters
    }
    validate_hash($clusters_real)
    create_resources('hbm::manage::cluster', $clusters_real)
  }

  if $collections != undef {
    if $collections_hiera_merge_real == true {
      $collections_real = hiera_hash('hbm::collections')
    } else {
      $collections_real = $collections
    }
    validate_hash($collections_real)
    create_resources('hbm::manage::collection', $collections_real)
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

  if $groups != undef {
    if $groups_hiera_merge_real == true {
      $groups_real = hiera_hash('hbm::groups')
    } else {
      $groups_real = $groups
    }
    validate_hash($groups_real)
    create_resources('hbm::manage::group', $groups_real)
  }

  if $hosts != undef {
    if $hosts_hiera_merge_real == true {
      $hosts_real = hiera_hash('hbm::hosts')
    } else {
      $hosts_real = $hosts
    }
    validate_hash($hosts_real)
    create_resources('hbm::manage::host', $hosts_real)
  }

  if $policies != undef {
    if $policies_hiera_merge_real == true {
      $policies_real = hiera_hash('hbm::policies')
    } else {
      $policies_real = $policies
    }
    validate_hash($policies_real)
    create_resources('hbm::manage::policy', $policies_real)
  }

  if $resources != undef {
    if $resources_hiera_merge_real == true {
      $resources_real = hiera_hash('hbm::resources')
    } else {
      $resources_real = $resources
    }
    validate_hash($resources_real)
    create_resources('hbm::manage::resource', $resources_real)
  }

  if $users != undef {
    if $users_hiera_merge_real == true {
      $users_real = hiera_hash('hbm::users')
    } else {
      $users_real = $users
    }
    validate_hash($users_real)
    create_resources('hbm::manage::user', $users_real)
  }

  if $manage_package_real and $manage_service_real {
    Package['package_hbm'] -> Service['service_hbm']
  }
}
