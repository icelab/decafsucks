require "snowpack/test/suite"

module DecafSucks
  class TestSuite < Snowpack::Test::Suite
    configure do |config|
      require_relative "./helpers"
      config.include Test::Helpers
    end
  end
end
