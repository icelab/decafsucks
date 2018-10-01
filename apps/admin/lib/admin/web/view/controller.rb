# auto_register: false

require "slim"
require "dry/view/controller"
require "decaf_sucks/admin/container"

module DecafSucks
  module Admin
    module Web
      module View
        class Controller < Dry::View::Controller
          configure do |config|
            config.paths = [Container.root.join("web/templates")]
            config.layout = "application"
          end
        end
      end
    end
  end
end
