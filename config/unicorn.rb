rails_env = ENV['RAILS_ENV'] || 'production'
root_path = '/var/lib/rails/tdf/tour-de-feb'

working_directory root_path
worker_processes 2

stdout_path "#{root_path}/log/unicorn.stdout.log"
stderr_path "#{root_path}/log/unicorn.stderr.log"

# Load master before forking workers for fast worker spawn times
preload_app true

# Restart any workers that haven't responded in 30 seconds
timeout 30

# Listen on a Unix data socket
listen '/var/run/unicorn/unicorn-tdf.sock', :backlog => 2048

before_fork do |server, worker|
  ##
  # When sent a USR2, Unicorn will suffix its pidfile with .oldbin and
  # immediately start loading up a new version of itself (loaded with a new
  # version of our app). When this new Unicorn is completely loaded
  # it will begin spawning workers. The first worker spawned will check to
  # see if an .oldbin pidfile exists. If so, this means we've just booted up
  # a new Unicorn and need to tell the old one that it can now die. To do so
  # we send it a QUIT.
  #
  # Using this method we get 0 downtime deploys.

  old_pid = RAILS_ROOT + '/tmp/pids/unicorn.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # no worries someone has done it for us.
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end
