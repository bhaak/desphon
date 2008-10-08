set :application, "desphon"
set :repository,  "file:///home/bubi/.subversion_repository/dsfo"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"
set :deploy_to, "/home/httpd/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

# checkout locally, then tar and gzip the copy
# and sftp it to the remote servers
set :deploy_via, :copy

role :app, "httpd@ganymed:8080"
role :web, "httpd@ganymed:8080"
role :db,  "httpd@ganymed:8080", :primary => true

namespace :deploy do
  task :start, :roles => :app do
    #run "chmod -R o+r #{current_release}"
    #run "chmod o+x #{current_release}/public/dispatch.fcgi"
    #run "chmod o+rwx #{current_release}/tmp"
    #run "find #{current_release} -type d | xargs chmod o+x "
    run "touch #{shared_path}/log/development.log #{shared_path}/log/fastcgi.crash.log #{shared_path}/log/production.log"
    run "chmod g+w #{shared_path}/log/*"
    #run "chgrp -R lighttpd #{deploy_to}"
    run "find #{deploy_to} -group users | xargs chgrp lighttpd"
  end

  task :stop, :roles => :app do
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
  end

task :check_ebuilds, :roles => :db do
  set :sqlite_local, `epm -q sqlite`.strip
  transaction do
    run "epm -q sqlite" do |ch,stream,out| set :sqlite_remote, out.strip end
  end
  raise "sqlite-Version nicht dieselbe! Lokal: #{sqlite_local} Remote: #{sqlite_remote}" if sqlite_remote != sqlite_local

  set :rails_local, `epm -q rails`.strip
  transaction do
    run "epm -q rails" do |ch,stream,out| set :rails_remote, out.strip end
  end
  raise "Rails-Version nicht dieselbe! Lokal: #{rails_local} Remote: #{rails_remote}" if rails_remote != rails_local
  before :deploy, :check_ebuilds
end

end

