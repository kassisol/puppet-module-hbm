
Puppet::Type.type(:hbm).provide(:action) do

  defaultfor :osfamily => :redhat

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
  ]

  commands :hbm => '/usr/sbin/hbm'

  def exists?
    findkey(resource[:provider], resource[:name])
  end

  def findkey(bucket, key)
    result = `#{command(:hbm)} #{bucket} ls`.split("\n")

    result.each do | a |
      if a == key
        return true
      end
    end
    false
  end

  def create
    unless ACTION_LIST.include?(@resource[:name])
      @resource.fail 'Must specify a valid action'
    end

    execute([command(:hbm), 'action', 'add', @resource[:name]])
  end

  def destroy
    execute([command(:hbm), 'action', 'rm', @resource[:name]])
  end
end
