DecafSucks::Container.boot :persistence, namespace: true do |container|
  init do
    require "sequel"
    require "rom"
    require "rom/sql"

    use :settings

    ROM::SQL.load_extensions(:postgres)

    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local

    rom_config = ROM::Configuration.new(
      :sql,
      container[:settings].database_url,
      extensions: %i[error_sql pg_array pg_json pg_enum],
    )

    rom_config.plugin :sql, relations: :instrumentation do |plugin_config|
      plugin_config.notifications = notifications
    end

    rom_config.plugin :sql, relations: :auto_restrictions

    register "config", rom_config
    register "db", rom_config.gateways[:default].connection
  end

  start do
    config = container["persistence.config"]

    config.auto_registration container.root.join("lib/decaf_sucks/persistence"), namespace: "DecafSucks::Persistence"

    register "rom", ROM.container(config)
  end
end
