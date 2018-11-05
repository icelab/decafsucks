# frozen_string_literal: true
# auto_register: false

require "typhoeus"
require "json"
require "decaf_sucks/geocoding/result"

module DecafSucks
  module Geocoding
    module Providers
      module Nominatim
        class Geocoder
          BASE_URL = "https://nominatim.openstreetmap.org/"
          DEFAULT_PARAMS = {format: "json"}.freeze

          SEARCH_URL = "#{BASE_URL}/search"
          SEARCH_PARAMS = DEFAULT_PARAMS.merge(addressdetails: 1).freeze

          def search(q:)
            response = Typhoeus.get(SEARCH_URL, params: SEARCH_PARAMS.merge(q: q))

            JSON.parse(response.body, symbolize_names: true).map { |result| Result.new(result) }
          end

          REVERSE_URL = "#{BASE_URL}/reverse"
          REVERSE_PARAMS = DEFAULT_PARAMS.merge(addressdetails: 1).freeze

          def reverse(lat:, lon:)
            response = Typhoeus.get(REVERSE_URL, params: REVERSE_PARAMS.merge(lat: lat, lon: lon))

            Result.new(JSON.parse(response.body, symbolize_names: true))
          end
        end
      end
    end
  end
end
