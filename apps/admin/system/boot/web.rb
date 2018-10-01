DecafSucks::Admin::Container.boot :web, namespace: true do |container|
  init do
    require "hanami/controller"
    require "snowflakes/web/router/endpoint_resolver"
  end

  start do
    register "router.endpoint_resolver", Snowflakes::Web::Router::EndpointResolver.new(container, "web.actions")
    register "action.configuration", Hanami::Controller::Configuration.new
  end
end
