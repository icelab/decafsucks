ROM::SQL.migration do
  change do
    create_table :reviews do
      primary_key :id
      foreign_key :cafe_id, :cafes, null: false
      foreign_key :reviewer_id, :users, null: false

      column :rating, :int, null: false
      column :body, :text, null: false

      column :created_at, :timestamp, null: false
      column :updated_at, :timestamp, null: false
    end
  end
end
