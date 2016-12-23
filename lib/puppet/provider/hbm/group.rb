require 'puppet/provider/hbm'

Puppet::Type.type(:hbm).provide(:group) do
  include Puppet::Provider::Hbm

  commands :hbm => '/usr/sbin/hbm'

  def exists?
    findkey(resource[:provider], resource[:name])
  end

  def create
    execute([command(:hbm), 'group', 'add', @resource[:name]])
  end

  def destroy
    execute([command(:hbm), 'group', 'rm', @resource[:name]])
  end
end
