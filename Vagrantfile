# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "memcached-berkshelf"
  config.omnibus.chef_version = :latest
  config.vm.network :private_network, type: "dhcp"
  
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.json = {
    }

    chef.run_list = [
        "recipe[memcached::default]"
    ]
  end
	
  config.vm.define "ubuntu_docker", primary: false, autostart: false do |ubuntu|
  # Ubuntu Docker container...
    ubuntu.ssh.password='t00r'
    ubuntu.ssh.username='root'
    ubuntu.vm.provider "docker" do |d|
      d.build_dir = "."
      d.has_ssh = true
      d.vagrant_machine = "ubuntu"
    end
  end

  config.vm.define "ubuntu1404", autostart: true, primary: true do |u14|
    u14.vm.box = "chef/ubuntu-14.04"
  end

  config.vm.define "centos65", primary: false, autostart: true do |centos|
    centos.vm.box = "chef/centos-6.5-i386"  
    centos.vm.provider "virtualbox" do |v|
    end
  end

end

