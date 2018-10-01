require "logger"
require "open3"

# This file is always required as part of a wrapper around snowflakes. Respect
# snowflakes' `-e` flag and set RACK_ENV accordingly, so when we load our
# containers below, they run in the right environment.
#
# This hack is necessary because our script helpers load the application
# containers before the snowflakes CLI has a chance to manage the environment.
if (env_flag_index = ARGV.index("-e"))
  ENV["RACK_ENV"] = ARGV[env_flag_index + 1] || "development"
end

APP_ROOT = File.expand_path("..", __dir__)

def in_app_root(spec)
  name, *scripts = Array(spec).flatten(1)

  Dir.chdir(APP_ROOT) do
    scripts.each do |script|
      system "bin/#{script}"
    end

    puts "[bin/#{name}]"

    yield
  end
end

def logger
  @logger ||= Logger.new("./log/scripts.log").tap do |logger|
    logger.formatter = proc do |_severity, _datetime, _progname, msg|
      "#{msg}\n"
    end
  end
end

def run(cmd, env: :development)
  execute_command("bin/run #{cmd} -e #{env}")
end

def task(name)
  execute_command("bundle exec rake #{name}")
end

def execute_command(cmd)
  puts "  Running #{cmd}"

  status = nil
  out = nil
  err = nil

  Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
    _pid = wait_thr.pid
    stdin.close
    out = stdout.read
    err = stderr.read
    status = wait_thr.value
  end

  if status.success?
    logger.info(cmd)
    logger.info(out)
  else
    logger.error(cmd)
    logger.error(err)
    raise "Failed to run #{cmd}. stderr: #{err}"
  end
end
