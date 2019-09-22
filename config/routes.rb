require "snowpack/web"
require "rack"

Snowpack::Web.routes do |application|
  use Rack::Lint

  use Rack::Static,
    urls: ["/assets"],
    root: "public"

  use Rack::Session::Cookie,
    key: "decaf_sucks.session",
    secret: application[:settings].session_secret,
    expire_after: 10 * 365 * 24 * 60 * 60 # 10 years

  # use Rack::Auth::Basic, "Decaf Sucks" do |username, password|
  #   password == "secret 2"
  # end

  mount :main, at: "/" do
    root to: "home"
  end

  # mount :admin, at: "/admin" do
  #   root to: "home"
  # end
end
