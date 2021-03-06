# encoding: utf-8
require 'serverspec'

#include SpecInfra::Helper::Exec
#include SpecInfra::Helper::DetectOS

set :backend, :exec

RSpec.configure do |c|
  if ENV['ASK_SUDO_PASSWORD']
    require 'highline/import'
    c.sudo_password = ask('Enter sudo password: ') { |q| q.echo = false }
  else
    c.sudo_password = ENV['SUDO_PASSWORD']
  end
end
