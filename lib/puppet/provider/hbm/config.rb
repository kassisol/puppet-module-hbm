
Puppet::Type.type(:hbm).provide(:config) do

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
    unless CONFIG_LIST.include?(@resource[:name])
      @resource.fail 'Must specify a valid config'
    end

    execute([command(:hbm), 'config', 'add', @resource[:name]])
  end

  def destroy
    execute([command(:hbm), 'config', 'rm', @resource[:name]])
  end
end
