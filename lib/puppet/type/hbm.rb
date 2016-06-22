require 'puppet/parameter/boolean'

Puppet::Type.newtype(:hbm) do
  @doc = %q{Set actions to allow command to be run by Docker.
    Example:
        hbm { 'container_create':
          ensure   => 'present',
          provider => 'action',
        }
        hbm { 'container_create_user_root':
          ensure   => 'absent',
          provider => 'config',
        }
        hbm { '/tmp/example':
          ensure   => 'present',
          provider => 'volume',
          recurse  => true,
        }
    }

  feature :recurse, "The provider accepts subdirectories for volume."

  ensurable

  newparam(:name) do
    desc 'An arbitrary name used as the identity of the resource.'

    validate do |value|
      if !value.is_a?(String)
        raise ArgumentError, "Name must be a String not #{value.class}"
      end
    end
  end

  providify
  paramclass(:provider).isnamevar

  def self.title_patterns
    [ [ /(.*)/m, [ [:name] ] ] ]
  end

  newparam(:recurse, :boolean => true,
          :required_features => :recurse,
          :parent => Puppet::Parameter::Boolean) do
    desc "Allows Volume subdirectory"
    defaultto false
  end
end
