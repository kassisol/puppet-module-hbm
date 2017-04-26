require 'puppet/provider/hbm'

Puppet::Type.type(:hbm).provide(:policy) do
  include Puppet::Provider::Hbm

  has_feature :collection
  has_feature :group

  commands :hbm => '/usr/sbin/hbm'

  def exists?
    findkey(resource[:provider], resource[:name])
  end

  def create
    unless findkey('collection', resource[:collection])
      @resource.fail 'Must specify a valid collection name'
    end

    unless findkey('group', resource[:group])
      @resource.fail 'Must specify a valid group name'
    end

    execute([command(:hbm), 'policy', 'add', '--collection', resource[:collection], '--group', resource[:group], resource[:name]])
  end

  def destroy
    execute([command(:hbm), 'policy', 'rm', resource[:name]])
  end
end
