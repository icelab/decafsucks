DecafSucks::Container.boot :settings, from: :system do
  before :init do
    require "decaf_sucks/types"
  end

  settings do
    # Web app
    key :session_secret, DecafSucks::Types::Strict::String.constrained(filled: true)
    key :log_to_stdout, DecafSucks::Types::Params::Bool

    # Assets
    key :assets_precompiled, DecafSucks::Types::Params::Bool
    key :assets_server_url, DecafSucks::Types::Strict::String.constrained(filled: true).optional.default(nil)

    # Persistence
    key :database_url, DecafSucks::Types::Strict::String.constrained(filled: true)
  end
end
