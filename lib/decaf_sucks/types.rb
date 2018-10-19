# auto_register: false

require "dry-struct"
require "dry-types"

module DecafSucks
  module Types
    include Dry::Types.module
  end
end

# TODO: remove this shim once snowflakes no longer requires it
Types = DecafSucks::Types
