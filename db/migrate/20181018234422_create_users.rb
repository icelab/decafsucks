ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :name, :text, null: false
      column :reviews_count, :int, null: false, default: 0
      column :created_at, :timestamp, null: false
      column :updated_at, :timestamp, null: false
    end
  end
end
