require 'bundler/capistrano'

set :application, "passenger-pickups"

set :repository, "ssh://drmac.humanizingwork.com/var/git/passenger_pickups.git"
set :branch, "master"
set :scm, :git

set :host, "humanizingwork.com"
server "humanizingwork.com", :app, :web, :db, :primary => true
set :deploy_to, "/var/www/#{application}"

set :rails_env, 'practice1'
set :rails_env_base, 'practice'

ssh_options[:port] = 2221
set :user, 'richard'
set :deploy_via, :remote_cache
set :copy_exclude, [".git/*", ".svn/*", ".idea/*"]
set :use_sudo, false

# Customise the deployment
set :tag_on_deploy, false # turn off deployment tagging, we have our own tagging strategy

set :keep_releases, 6
after "deploy:update", "deploy:cleanup"

before "deploy:finalize_update", "bundle:install"

set :deployment_strategy, :passenger

# rvm integration
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-1.8.7-p334@passenger_pickups'

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  namespace :migrate do
    task :all, :roles => :db do
      (1..6).each do |i|
        run "cd #{current_path}; #{rake} RAILS_ENV=#{rails_env_base + i} db:migrate"
      end
    end
  end
end