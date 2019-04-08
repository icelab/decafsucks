require "hanami/router"
require "rack"
require "snowflakes/web/common_logger"

module DecafSucks
  module Admin
    module Web
      class Application
        def initialize(container)
          routes = Hanami::Router.new(
            resolver: container["web.router.endpoint_resolver"],
            configuration: container["web.action.configuration"],
          ) do
            eval(File.read(File.join(__dir__, "routes.rb")))
          end

          @app = Rack::Builder.new do
            run routes
          end.to_app.freeze

          freeze
        end

        def call(env)
          @app.call(env)
        end
      end
    end
  end
end
