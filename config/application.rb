require "logger"
require "snowflakes/application"
require "snowflakes/components"
require "snowflakes/web/plugin"

module DecafSucks
  class Application < Snowflakes::Application
    use :web

    configure do
      config.name = :decaf_sucks
      config.log_levels = %i[test development production].map { |e| [e, Logger::DEBUG] }.to_h
      config.default_namespace = "decaf_sucks"
      config.auto_register = %w[lib/decaf_sucks]
    end
  end
end
