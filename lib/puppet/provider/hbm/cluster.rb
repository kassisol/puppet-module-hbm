require 'puppet/provider/hbm'

Puppet::Type.type(:hbm).provide(:cluster) do
  include Puppet::Provider::Hbm

  commands :hbm => '/usr/sbin/hbm'

  def exists?
    findkey(resource[:provider], resource[:name])
  end

  def create
    execute([command(:hbm), 'cluster', 'add', @resource[:name]])
  end

  def destroy
    execute([command(:hbm), 'cluster', 'rm', @resource[:name]])
  end
end
