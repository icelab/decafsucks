ROM::SQL.migration do
  change do
    create_table :cafes do
      primary_key :id
      column :name, :text, null: false

      column :address, :text, null: false
      column :coordinates, :point

      column :rating, :int, index: true
      column :reviews_count, :int, null: false, default: 0
      column :last_reviewed_at, :timestamp, index: true

      column :created_at, :timestamp, null: false
      column :updated_at, :timestamp, null: false
    end
  end
end
