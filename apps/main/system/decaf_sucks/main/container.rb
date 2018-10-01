require "logger"
require "dry/web/container"
require "dry/system/components"

module DecafSucks
  module Main
    class Container < Dry::Web::Container
      require root.join("system/decaf_sucks/container")
      import core: DecafSucks::Container

      configure do
        config.name = :decaf_sucks
        config.root = Pathname(__dir__).join("../../").realpath.dirname.freeze
        config.logger = DecafSucks::Container[:logger]
        config.log_levels = %i[test development production].map { |e| [e, Logger::DEBUG] }.to_h
        config.default_namespace = "decaf_sucks.main"
        config.auto_register = %w[lib/decaf_sucks/main]
      end

      load_paths! "lib"
    end
  end
end
