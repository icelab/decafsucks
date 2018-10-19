ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :name, :text, null: false
      column :reviews_count, :int, null: false, default: 0
    end
  end
end
