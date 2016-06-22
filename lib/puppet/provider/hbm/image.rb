
Puppet::Type.type(:hbm).provide(:image) do

  commands :hbm => '/usr/bin/hbm'

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
    execute([command(:hbm), 'image', 'add', @resource[:name]])
  end

  def destroy
    execute([command(:hbm), 'image', 'rm', @resource[:name]])
  end
end
