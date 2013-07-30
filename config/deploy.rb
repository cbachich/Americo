require "rvm/capistrano"
require "bundler/capistrano"

set :application, "AmeriCo"
set :deploy_to, "/home/cbachich/apps/americo"
set :repository,  "git@github.com:cbachich/Americo.git"
set :rvm_ruby_string, "2.0.0@americo"
set :use_sudo, false
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "cbachich"
role :web, "192.241.222.247"                          # Your HTTP server, Apache/etc
role :app, "192.241.222.247"                          # This may be the same as your `Web` server
role :db,  "192.241.222.247", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
after "deploy", "rvm:trust_rvmrc"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end
