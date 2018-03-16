require 'puppet/provider/hbm'

Puppet::Type.type(:hbm).provide(:config) do
  include Puppet::Provider::Hbm

  commands :hbm => '/usr/sbin/hbm'

  def exists?
    conf_exists()
  end

  def create
    execute([command(:hbm), 'config', 'set', @resource[:name], 'true'])
  end

  def destroy
    execute([command(:hbm), 'config', 'set', @resource[:name], 'false'])
  end
end
