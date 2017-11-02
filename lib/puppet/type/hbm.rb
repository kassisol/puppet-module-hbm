require 'puppet/parameter/boolean'

Puppet::Type.newtype(:hbm) do
  @doc = %q{Set actions to allow command to be run by Docker.

    Example:
      hbm { 'collection1':
        ensure   => 'present',
        provider => 'collection',
      }
      hbm { 'resource1':
        ensure   => 'present',
        provider => 'resource',
        type     => 'volume',
        value    => '/tmp/test',
        options  => ['recursive'],
        members  => ['collection1'],
      }
      hbm { 'group1':
        ensure   => 'present',
        provider => 'group',
      }
      hbm { 'user1':
        ensure   => 'present',
        provider => 'user',
        members  => ['group1'],
      }
      hbm { 'policy1':
        ensure     => present,
        provider   => 'policy',
        collection => 'collection1',
        group      => 'group1',
      }
  }

  feature :members, "The provider accepts members parameter for host, resource and user."

  feature :type, "The provider accepts type parameter for resource."
  feature :value, "The provider accepts value parameter for resource."
  feature :options, "The provider accepts options parameter for resource."

  feature :collection, "The provider accepts collections parameter for policy."
  feature :group, "The provider accepts group parameter for policy."

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

  newparam(:members) do
    desc "Members."

    validate do |value|
      if !value.is_a?(Array)
        if value.is_a?(String)
          unless value =~ /^[a-z]{1}[a-zA-Z0-9\-\_]+$/
            raise ArgumentError, "Members value #{value} is not valid"
          end
        else
          raise ArgumentError, "Members must be an Array not #{value.class}"
        end
      end
    end
  end

  newparam(:type) do
    desc "Resource's type."

    newvalues(:action, :cap, :config, :device, :dns, :image, :logdriver, :logopt, :port, :registry, :volume)
  end

  newparam(:value) do
    desc "Resource's value."
  end

  newparam(:options) do
    desc "Resource's options."

    valids = ['recursive=true', 'recursive=false', 'nosuid=true', 'nosuid=false']

    validate do |value|
      if !value.is_a?(Array)
        if value.is_a?(String)
          unless valids.include?(value)
            raise ArgumentError, "Options #{value} is not valid"
          end
        else
          raise ArgumentError, "Options must be an Array not #{value.class}"
        end
      end
    end
  end

  newparam(:collection) do
    desc "Collection's name."
  end

  newparam(:group) do
    desc "Group's name."
  end
end
