# encoding: utf-8
require 'chefspec'
require 'chefspec/berkshelf'

require_relative 'supported_platforms.rb'

at_exit { ChefSpec::Coverage.report! }
