require "hanami"
require "snowpack/components"

module DecafSucks
  class Application < Hanami::Application
    config.slices_namespace = DecafSucks
    config.action_key_namespace = "web.actions"
  end
end
