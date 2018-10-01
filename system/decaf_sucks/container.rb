require "logger"
require "dry/web/container"
require "dry/system/components"

module DecafSucks
  class Container < Dry::Web::Container
    configure do
      config.name = :decaf_sucks
      config.log_levels = %i[test development production].map { |e| [e, Logger::DEBUG] }.to_h
      config.default_namespace = "decaf_sucks"
      config.auto_register = %w[lib/decaf_sucks]
    end

    load_paths! "lib"
  end
end
