require "logger"
require "hanami"
require "snowpack/components"

module DecafSucks
  class Application < Hanami::Application
    config.slices_namespace = DecafSucks
  end
end
