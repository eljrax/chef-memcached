require 'spec_helper'

describe 'memcached' do

  ## Test the platform specific stuff
    memcached_test_platforms.each do |platform, versions|
        if "#{platform}" == "centos"
            describe "on #{platform}" do
                let(:chef_run) do
                    runner = ChefSpec::Runner.new(platform: "centos".to_s, version: "6.5".to_s)
                    runner.converge('memcached')
                end
                it 'creates memcached config file (rhel)' do
                    expect(chef_run).to create_template('/etc/sysconfig/memcached')
                end
            end
        end
        if "#{platform}" == "ubuntu"
            describe "on #{platform}" do
                let(:chef_run) do
                    runner = ChefSpec::Runner.new(platform: "ubuntu".to_s, version: "14.04".to_s)
                    runner.converge('memcached')
                end
                it 'creates memcached config file (ubuntu)' do
                    expect(chef_run).to create_template('/etc/memcached.conf')
                end 	
            end #describe
        end # if platform ubuntu
    end


# Test the platform agnostic stuff

  let(:chef_run) {ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs memcached' do
      expect(chef_run).to install_package('memcached')
  end
  it 'starts memcached' do
      expect(chef_run).to start_service('memcached')
  end

        


end


