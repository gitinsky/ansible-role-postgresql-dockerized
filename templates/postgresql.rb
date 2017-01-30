Eye.application 'postgresql' do
  working_dir '/'
  stdall '/var/log/eye/postgresql-stdall.log' # stdout,err logs for processes by default
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :postgresql do
    pid_file '/var/run/postgresql/9.6-main.pid'
    trigger :transition, to: :starting, do: -> {
      cmd = "/root/prestart.sh"
      res = process.execute(cmd, process.config.merge(:timeout => 200.seconds))
      info "executing `#{cmd}` with result: #{res}"
    }
    start_command 'sudo -u postgres /usr/lib/postgresql/9.6/bin/postmaster -p 5432 --config-file=/etc/postgresql/9.6/main/postgresql.conf'

    start_timeout 10.seconds
    stop_timeout 5.seconds

  end

end
