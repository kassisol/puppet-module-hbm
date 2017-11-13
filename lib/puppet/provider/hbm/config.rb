require 'puppet/provider/hbm'

Puppet::Type.type(:hbm).provide(:config) do
  include Puppet::Provider::Hbm

  commands :hbm => '/usr/sbin/hbm'

  def exists?
    res_exists()
  end

  def create
    res_create()
  end

  def destroy
    res_destroy()
  end
end
