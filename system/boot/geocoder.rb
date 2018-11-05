DecafSucks::Container.boot :geocoder do
  start do
    require "decaf_sucks/geocoding/providers/nominatim/geocoder"

    register :geocoder, DecafSucks::Geocoding::Providers::Nominatim::Geocoder.new
  end
end
