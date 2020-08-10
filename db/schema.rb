# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_10_040938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street_name"
    t.integer "street_number"
    t.integer "zip_code"
    t.string "unit_type"
    t.string "apt_number"
    t.boolean "has_interior?"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "persona_id"
    t.index ["persona_id"], name: "index_addresses_on_persona_id"
  end

  create_table "factions", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.string "faction_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guns", force: :cascade do |t|
    t.string "serial_number"
    t.string "model"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "persona_id"
    t.index ["persona_id"], name: "index_guns_on_persona_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "admin_level"
    t.string "password_digest"
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "sex"
    t.string "race"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "member_id"
    t.bigint "faction_id"
    t.index ["faction_id"], name: "index_personas_on_faction_id"
    t.index ["member_id"], name: "index_personas_on_member_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "year"
    t.string "make"
    t.string "model"
    t.string "color"
    t.string "plate_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "persona_id"
    t.index ["persona_id"], name: "index_vehicles_on_persona_id"
  end

  add_foreign_key "addresses", "personas"
  add_foreign_key "guns", "personas"
  add_foreign_key "personas", "factions"
  add_foreign_key "personas", "members"
  add_foreign_key "vehicles", "personas"
end
