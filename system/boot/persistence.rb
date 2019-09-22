DecafSucks::Application.boot :persistence, namespace: true, from: :snowpack do
  configure do |config|
    config.database_url = container[:settings].database_url
    config.global_extensions = [:postgres]
    config.connection_extensions = %i[error_sql pg_array pg_json pg_enum]
    config.auto_registration_root = container.root.join("lib/decaf_sucks/persistence").realpath.to_s
    config.auto_registration_namespace = "DecafSucks::Persistence"
  end
end
