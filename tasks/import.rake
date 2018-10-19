# frozen_string_literals: true

require "csv"
require "pathname"

desc "Import leegacy content from CSV files in _imports/"
task :import do
  point_struct = Struct.new(:x, :y)

  require_relative "../system/decaf_sucks/container"

  relations = DecafSucks::Container["persistence.rom"].relations

  imports_dir = Pathname(File.join(__dir__, "../_imports"))

  cafes = CSV.read(imports_dir.join("houses.csv"), headers: true)

  cafes.each do |cafe|
    relations[:cafes].changeset(
      :create,
      id: cafe["id"],
      name: cafe["name"],
      address: cafe["address"],
      coordinates: cafe["lat"] && point_struct.new(cafe["lat"], cafe["lng"]),
      rating: cafe["rating"],
      reviews_count: cafe["reviews_count"],
      last_reviewed_at: cafe["last_reviewed_at"],
      created_at: cafe["created_at"],
      updated_at: cafe["updated_at"],
    ).commit
  end

  users = CSV.read(imports_dir.join("users.csv"), headers: true)

  CSV.foreach(imports_dir.join("login_accounts.csv"), headers: true) do |account|
    user = users.detect { |u| u["id"] == account["user_id"] } or raise "no user for #{account}"

    relations[:users].changeset(
      :create,
      id: account["user_id"],
      name: account["name"],
      reviews_count: user["reviews_count"] || 0,
      created_at: user["created_at"],
      updated_at: user["updated_at"],
    ).commit
  end

  CSV.foreach(imports_dir.join("reviews.csv"), headers: true) do |review|
    cafe = cafes.detect { |cafe| cafe["id"] == review["house_id"] }

    next unless cafe

    relations[:reviews].changeset(
      :create,
      id: review["id"],
      cafe_id: review["house_id"],
      reviewer_id: review["user_id"],
      rating: review["rating"],
      body: review["body"],
      created_at: review["created_at"],
      updated_at: review["updated_at"],
    ).commit
  end
end
