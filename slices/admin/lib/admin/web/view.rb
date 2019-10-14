# auto_register: false

require "slim"
require "dry/view"

module DecafSucks
  module Admin
    module Web
      class View < Dry::View
        config.paths = ["#{Slice.root}/web/templates"]
        config.layout = "application"
      end
    end
  end
end
