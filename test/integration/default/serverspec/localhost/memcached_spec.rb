require 'spec_helper'

describe package('memcached') do
  it { should be_installed }
end

if os[:family] == 'RedHat' 
  describe file('/etc/sysconfig/memcached') do
    it { should be_file }
    its(:content) { should match /PORT="11211"/ }
  end
else
  describe file('/etc/memcached.conf') do
    it { should be_file }
    its(:content) { should match /-p\ 11211/ }
  end
end

describe service('memcached') do  
  it { should be_enabled   }
  it { should be_running   }
end  

describe port(11211) do
  it {should be_listening }
end

