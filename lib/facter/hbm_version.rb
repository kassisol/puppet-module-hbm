# hbm_version.rb

Facter.add('hbm_version') do
  confine :kernel => 'Linux'

  setcode do
    hbm_bin = '/usr/sbin/hbm'
    version = 'none'

    if File.file?(hbm_bin)
      version = `#{hbm_bin} version | awk '{ print $2 }' 2> /dev/null`.strip
    end

    version
  end
end
