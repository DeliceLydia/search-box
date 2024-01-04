ActiveRecord::Schema[7.1].define(version: 2024_01_04_121452) do
  create_table "articles", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
