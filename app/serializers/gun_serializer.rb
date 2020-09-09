class GunSerializer
  include FastJsonapi::ObjectSerializer
  attributes :serial_number, :model, :description, :persona
end

# create_table "guns", force: :cascade do |t|
#   t.string "serial_number"
#   t.string "model"
#   t.string "description"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.bigint "persona_id"
#   t.index ["persona_id"], name: "index_guns_on_persona_id"
# end