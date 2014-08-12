require 'spec_helper'

describe package('memcached') do
  it { should be_installed }
end

if os[:family] == 'RedHat'
  describe file('/etc/sysconfig/memcached') do
    it { should be_file }
    its(:content) { should match(/PORT="11212"/) }
  end
else
  describe file('/etc/memcached.conf') do
    it { should be_file }
    its(:content) { should match(/-p\ 11212/) }
  end
end

describe service('memcached') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(112_12) do
  it { should be_listening }
end
