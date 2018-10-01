require_relative "system/boot"
require "decaf_sucks/web/application"

run DecafSucks::Web::Application.new(
  core: DecafSucks::Container,
  main: DecafSucks::Main::Container,
  admin: DecafSucks::Admin::Container,
)
