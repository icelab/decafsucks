require "decaf_sucks/web/action"

module DecafSucks
  module Main
    module Web
      module Actions
        class Home < DecafSucks::Web::Action
          include Import[view: "web.views.home"]

          def handle(req, res)
            render(view, req, res)
          end
        end
      end
    end
  end
end
