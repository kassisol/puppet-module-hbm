
Puppet::Type.type(:hbm).provide(:volume) do

  has_feature :recurse

  commands :hbm => '/usr/sbin/hbm'

  def exists?
    findkey(resource[:provider], resource[:name], resource[:recurse])
  end

  def findkey(bucket, key, recurse)
    result = `#{command(:hbm)} #{bucket} ls`.split("\n")

    result.each do | a |
      line = a.split
      if line[1] == key and to_boolean(line[0]) == recurse
        return true
      end
    end
    false
  end

  def to_boolean(str)
    if str == 'true'
      return true
    elsif str == 'false'
      return false
    end

    return str
  end

  def create
    cmd = Array[command(:hbm), 'volume', 'add']

    if @resource[:recurse]
      cmd.push('--recursive')
    end

    cmd.push(@resource[:name])

    execute(cmd)
  end

  def destroy
    execute([command(:hbm), 'volume', 'rm', @resource[:name]])
  end
end
