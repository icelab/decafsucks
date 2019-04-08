require_relative "system/decaf_sucks/application"
DecafSucks::Application.boot!

require "decaf_sucks/web/application"

run DecafSucks::Web::Application.new(
  core: DecafSucks::Application,
  main: DecafSucks::Main::Slice,
  admin: DecafSucks::Admin::Slice,
)
