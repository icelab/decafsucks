require "logger"
require "snowflakes/application"
require "snowflakes/components"

module DecafSucks
  class Application < Snowflakes::Application
    configure do
      config.name = :decaf_sucks
      config.log_levels = %i[test development production].map { |e| [e, Logger::DEBUG] }.to_h
      config.default_namespace = "decaf_sucks"
      config.auto_register = %w[lib/decaf_sucks]
    end
  end
end
