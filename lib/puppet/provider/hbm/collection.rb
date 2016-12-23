require 'puppet/provider/hbm'

Puppet::Type.type(:hbm).provide(:collection) do
  include Puppet::Provider::Hbm

  commands :hbm => '/usr/sbin/hbm'

  def exists?
    findkey(resource[:provider], resource[:name])
  end

  def create
    execute([command(:hbm), 'collection', 'add', @resource[:name]])
  end

  def destroy
    execute([command(:hbm), 'collection', 'rm', @resource[:name]])
  end
end
