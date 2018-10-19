DecafSucks::Container.boot :persistence, namespace: true, from: :snowflakes do
  before(:init) do
    # dry-types compatibility shims for rom-sql
    #
    # TODO: remove once rom-sql has an update compatible with dry-types >= 0.13
    # require "dry/types"
    # require "dry/types/compat/int"
    # require "dry/types/compat/form_types"
  end

  after(:init) do
    require "sequel_pg"
  end

  configure do |config|
    config.database_url = container.settings.database_url
    config.global_extensions = [:postgres]
    config.connection_extensions = %i[error_sql pg_array pg_json pg_enum]
  end
end
