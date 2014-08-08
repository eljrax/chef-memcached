#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#include_recipe 'chef-sugar'

package 'memcached' do
  action :install
end

service 'memcached' do
  supports start: true, stop: true, restart: true
  action [ :enable, :start ]
end

template "/etc/sysconfig/memcached" do
  source "memcached-rhel.conf.erb"
  mode 0644
  owner "root"
  group "root"
  action :create
  notifies :restart, 'service[memcached]', :immediately
  only_if { platform_family?("rhel") }
end

template "/etc/memcached.conf" do
  source "memcached-debian.conf.erb"
  mode 0644
  owner "root"
  group "root"
  action :create
  notifies :restart, 'service[memcached]', :immediately
  only_if { platform_family?("debian") }
end
