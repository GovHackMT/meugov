# Roles
role :app, %w{104.236.192.58}
role :web, %w{104.236.192.58}
role :db,  %w{104.236.192.58}

# RVM
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.2.4'

set :password, ask('Server password', nil)
server '104.236.192.58', user: 'deploy', password: fetch(:password), roles: %w{web app}

set :rails_env, 'production'

set :deploy_to, '/home/deploy/meugov'
