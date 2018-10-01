require "decaf_sucks/main/web/view/controller"

module DecafSucks
  module Main
    module Web
      module Views
        class Home < View::Controller
          configure do |config|
            config.template = "home"
          end
        end
      end
    end
  end
end
