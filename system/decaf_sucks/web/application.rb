require "rack"
require "snowflakes/web/common_logger"

require "decaf_sucks/main/web/application"
require "decaf_sucks/admin/web/application"

module DecafSucks
  module Web
    class Application
      def initialize(**containers)
        core, main, admin = containers.values_at(:core, :main, :admin)

        @app = Rack::Builder.new do
          use Snowflakes::Web::CommonLogger, core["logger"]

          use Rack::Lint

          use Rack::Session::Cookie,
            key: "decaf_sucks.session",
            secret: core["settings"].session_secret,
            expire_after: 10 * 365 * 24 * 60 * 60 # 10 years

          use Rack::Static,
            urls: ["/assets"],
            root: "public"

          map "/admin" do
            run Admin::Web::Application.new(admin)
          end

          run Main::Web::Application.new(main)
        end.to_app.freeze

        freeze
      end

      def call(env)
        @app.call(env)
      end
    end
  end
end
