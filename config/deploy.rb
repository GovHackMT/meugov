# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'meugov'
set :repo_url, 'https://johnwmcarneiro@github.com/GovHackMT/meugov.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/assets')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, {
  'MEUGOV_DATABASE_PASSWORD' => 'p@$$w0rd16'
}

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc "reload the database with seed data"
  task :seed do
    on roles(:app) do |host|
      run_interactively "bundle exec rake db:seed RAILS_ENV=#{fetch(:rails_env)}", host
    end
  end
end

namespace :rails do
  desc "Remote console"
  task :console do
    on roles(:app) do |host|
      run_interactively "bundle exec rails console #{fetch(:rails_env)}", host
    end
  end

  desc "Remote dbconsole"
  task :dbconsole do
    on roles(:app) do |host|
      run_interactively "bundle exec rails dbconsole #{fetch(:rails_env)}", host
    end
  end

  def run_interactively(command, h)
    info "Running `#{command}` as #{h.user}@#{host}:#{h.port}"
    exec %Q(ssh -p #{h.port} #{h.user}@#{host} -t "bash --login -c 'cd #{fetch(:deploy_to)}/current && #{command}'")
  end
end

