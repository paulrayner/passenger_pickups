# rvm integration
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-1.8.7-p334@passenger_pickups'

set :host, "pp.humanizingwork.com"
set :branch, "practice"