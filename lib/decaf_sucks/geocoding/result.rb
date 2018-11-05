# auto_register: false

require "decaf_sucks/types"

module DecafSucks
  module Geocoding
    class Result < Dry::Struct
      attribute :lat, Types::Strict::String
      attribute :lon, Types::Strict::String
      attribute :display_name, Types::Strict::String
      attribute :address do
        attribute :road, Types::Strict::String
        attribute :suburb, Types::Strict::String
        attribute :city, Types::Strict::String
        attribute :state, Types::Strict::String
        attribute :postcode, Types::Strict::String
        attribute :country, Types::Strict::String
        attribute :country_code, Types::Strict::String
      end
    end
  end
end
