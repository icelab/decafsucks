DecafSucks::Application.register_bootable :monitor do
  init do
    require "dry/monitor/sql/logger"
  end

  start do
    Dry::Monitor::SQL::Logger.new(logger).subscribe(notifications)
  end
end
