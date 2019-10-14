source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby "2.6.2"

gem "rake"

# Framework
gem "dry-system"
gem "dry-web"
# gem "hanami", path: "~/src/github.com/hanami/hanami"
gem "hanami", github: "hanami/hanami", branch: "enhancement/application-and-slices"
gem "hanami-cli", github: "hanami/cli", branch: "unstable"
gem "hanami-utils", github: "hanami/utils", branch: "unstable"
gem "hanami-router", github: "hanami/router", branch: "unstable"
gem "hanami-controller", github: "hanami/controller", branch: "unstable"
gem "puma"
gem "rack"
gem "snowpack", github: "icelab/snowpack"

# Persistence
gem "pg"
gem "rom", github: "rom-rb/rom", branch: "master"
gem "rom-sql", github: "rom-rb/rom-sql", branch: "master"
gem "sequel_pg"

# Application dependencies
gem "dry-auto_inject"
gem "dry-matcher", "~> 0.8", ">= 0.8.2"
gem "dry-monads", "~> 1.0"
gem "dry-schema", "~> 0.5"
gem "dry-struct"
gem "dry-types"
gem "dry-validation", "1.0.0.rc1"
gem "dry-view"
gem "down"
gem "slim"

group :development, :test do
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
