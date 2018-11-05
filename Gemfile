source "https://rubygems.org"

ruby "2.5.1"

gem "rake"
gem "snowflakes", git: "https://github.com/icelab/snowflakes", branch: "master"
gem "inflecto" # FIXME: required for snowflakes, remove later

# Web framework
gem "dry-system"
gem "dry-web"
gem "hanami-utils", git: "https://github.com/hanami/utils.git", branch: "unstable"
gem "hanami-router", git: "https://github.com/hanami/router.git", branch: "configurable-endpoint-resolver"
gem "hanami-controller", git: "https://github.com/hanami/controller.git", branch: "action-new"
gem "puma"
gem "rack"

# Persistence
gem "pg"
gem "rom", git: "https://github.com/rom-rb/rom.git", branch: "master"
gem "rom-sql", git: "https://github.com/rom-rb/rom-sql.git", branch: "master"
gem "sequel_pg"

# Application dependencies
gem "dry-auto_inject", git: "https://github.com/dry-rb/dry-auto_inject.git", branch: "respect-previously-defined-ivars-during-initialize"
gem "dry-matcher"
gem "dry-monads"
gem "dry-struct"
gem "dry-transaction"
gem "dry-types"
gem "dry-validation"
gem "dry-view"
gem "down", "~> 4.6"
gem "slim", "~> 4.0"
gem "typhoeus", "~> 1.3"

group :development, :test do
  gem "foreman"
  gem "guard"
  gem "guard-rack"
  gem "pry-byebug", platform: :mri
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "poltergeist"
  gem "rspec"
end
