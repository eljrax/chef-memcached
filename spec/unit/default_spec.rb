require 'spec_helper.rb'

describe 'memcached::default' do
    before do
      Fauxhai.mock(platform: 'debian', version: '7.0')
    end

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs memcached' do
    expect(chef_run).to install_package('memcached')
  end

  it 'renders memcached' do
    expect(chef_run).to create_template('/etc/sysconfig/memcached')
  end

  it 'creates config file' do
    expect(chef_run).to create_template('/etc/memcached.conf')
  end

  it 'starts memcached' do
    expect(chef_run).to start_service('memcached')
  end


  it 'restarts memcached' do
    resource = chef_run.template('/etc/sysconfig/memcached')
    expect(resource).to notify('service[memcached]').to(:restart).immediately
  end
end



