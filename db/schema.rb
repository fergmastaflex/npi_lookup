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

ActiveRecord::Schema.define(version: 2020_08_10_190014) do

  create_table "addresses", force: :cascade do |t|
    t.string "country_code"
    t.string "country_name"
    t.string "address_purpose"
    t.string "address_type"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "telephone_number"
    t.integer "provider_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider_id"], name: "index_addresses_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.integer "npi"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string "code"
    t.string "desc"
    t.boolean "primary"
    t.string "state"
    t.string "license"
    t.integer "provider_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider_id"], name: "index_taxonomies_on_provider_id"
  end

  add_foreign_key "addresses", "providers"
  add_foreign_key "taxonomies", "providers"
end
