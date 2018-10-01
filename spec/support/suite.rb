require "snowflakes/test/suite"

module DecafSucks
  class TestSuite < Snowflakes::Test::Suite
    configure do |config|
      require_relative "./helpers"
      config.include Test::Helpers
    end
  end
end
