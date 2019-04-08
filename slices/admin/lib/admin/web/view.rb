# auto_register: false

require "slim"
require "dry/view"
require "decaf_sucks/admin/slice"

module DecafSucks
  module Admin
    module Web
      class View < Dry::View
        config.paths = [Slice.root.join("web/templates")]
        config.layout = "application"
      end
    end
  end
end
