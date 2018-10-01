ENV["RACK_ENV"] = "test"

require_relative "./support/suite"

SPEC_ROOT = Pathname(__FILE__).dirname
FIXTURES_PATH = SPEC_ROOT.join("fixtures").freeze

suite = DecafSucks::TestSuite.instance

suite.start_coverage
suite.require_containers
