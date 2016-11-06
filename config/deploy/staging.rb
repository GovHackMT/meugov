# Roles
role :app, %w{modularize.com.br}
role :web, %w{modularize.com.br}
role :db,  %w{modularize.com.br}

# RVM
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.1.1'

set :password, ask('Server password', nil)
server 'modularize.com.br', user: 'modularize', port: 4102, password: fetch(:password), roles: %w{web app}

set :rails_env, 'staging'

set :deploy_to, '/home/modularize/apps/oms_staging'
