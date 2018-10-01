DecafSucks::Container.boot :assets do |container|
  init do
    require "snowflakes/assets"
  end

  start do
    use :settings

    assets = Snowflakes::Assets.new(
      root: container.root,
      precompiled: container.config.env == :production || container[:settings].assets_precompiled,
      server_url: container[:settings].assets_server_url,
    )

    register :assets, assets
  end
end
