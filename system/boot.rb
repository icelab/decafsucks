require_relative "decaf_sucks/container"

container = DecafSucks::Container
container.finalize!

Dir[container.root.join("apps").realpath.join("*")].each do |f|
  require "#{f}/system/boot"
end
