require 'puppet/provider/hbm'

Puppet::Type.type(:hbm).provide(:resource) do
  include Puppet::Provider::Hbm

  has_feature :type
  has_feature :value
  has_feature :options
  has_feature :members

  ACTION_LIST = [
    'container_list',
    'container_create',
    'container_inspect',
    'container_top',
    'container_logs',
    'container_changes',
    'container_export',
    'container_stats',
    'container_resize',
    'container_start',
    'container_stop',
    'container_restart',
    'container_kill',
    'container_update',
    'container_rename',
    'container_pause',
    'container_unpause',
    'container_attach',
    'container_attach_ws',
    'container_wait',
    'container_remove',
    'container_copy',
    'container_archive_info',
    'container_archive',
    'container_archive_extract',
    'container_exec_create',
    'exec_start',
    'exec_resize',
    'exec_inspect',
    'image_list',
    'image_build',
    'image_create',
    'image_inspect',
    'image_history',
    'image_push',
    'image_tag',
    'image_remove',
    'image_search',
    'image_save_image',
    'image_save_images',
    'image_load',
    'auth',
    'info',
    'version',
    'ping',
    'commit',
    'events',
    'volume_list',
    'volume_create',
    'volume_inspect',
    'volume_remove',
    'network_list',
    'network_inspect',
    'network_create',
    'network_connect',
    'network_disconnect',
    'network_remove',
    'node_list',
    'node_inspect',
    'node_remove',
    'node_update',
    'swarm_info',
    'swarm_init',
    'swarm_join',
    'swarm_leave',
    'swarm_update',
    'service_list',
    'service_create',
    'service_remove',
    'service_inspect',
    'service_update',
    'task_list',
    'task_inspect',
  ]

  CONFIG_LIST = [
    'container_create_privileged',
    'container_create_ipc_host',
    'container_create_net_host',
    'container_create_pid_host',
    'container_create_userns_host',
    'container_create_uts_host',
    'container_create_user_root',
    'image_create_official',
  ]

  commands :hbm => '/usr/sbin/hbm'

  def exists?
    res_exists()
  end

  def create
    if resource[:type] == 'action'
      unless ACTION_LIST.include?(resource[:value])
        resource.fail 'Must specify a valid action'
      end
    end

    if resource[:type] == 'config'
      unless CONFIG_LIST.include?(resource[:value])
        resource.fail 'Must specify a valid config'
      end
    end

    res_create()
  end

  def destroy
    res_destroy()
  end
end
