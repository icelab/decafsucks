DecafSucks::Application.register_bootable :assets do |container|
  init do
    require "snowpack/assets"
  end

  start do
    use :settings

    assets = Snowpack::Assets.new(
      root: container.root,
      precompiled: container.config.env == :production || container[:settings].assets_precompiled,
      server_url: container[:settings].assets_server_url,
    )

    register :assets, assets
  end
end
