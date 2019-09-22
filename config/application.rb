require "logger"
require "snowpack/application"
require "snowpack/components"
require "snowpack/web/plugin"

module DecafSucks
  class Application < Snowpack::Application
    use :web

    configure do
      config.name = :decaf_sucks
      config.log_levels = %i[test development production].map { |e| [e, Logger::DEBUG] }.to_h
      config.default_namespace = "decaf_sucks"
      config.auto_register = %w[lib/decaf_sucks]
    end
  end
end
