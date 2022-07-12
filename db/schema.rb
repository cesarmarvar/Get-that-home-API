# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_12_003930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyer_properties", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.bigint "user_id", null: false
    t.integer "property_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_buyer_properties_on_property_id"
    t.index ["user_id"], name: "index_buyer_properties_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.float "price"
    t.float "maintenance"
    t.integer "property_type"
    t.boolean "pets"
    t.text "about"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "area"
    t.integer "operation_type"
    t.bigint "user_id", null: false
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_properties_on_address", unique: true
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_type"
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.string "password_digest"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "buyer_properties", "properties"
  add_foreign_key "buyer_properties", "users"
  add_foreign_key "properties", "users"
end
