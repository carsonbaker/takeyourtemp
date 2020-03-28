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

ActiveRecord::Schema.define(version: 2020_03_28_025918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "readings", force: :cascade do |t|
    t.float "temp_f"
    t.integer "age"
    t.integer "zipcode"
    t.string "sex"
    t.string "site"
    t.datetime "created_at"
    t.string "browser_uuid"
    t.integer "household_person"
    t.boolean "sym_cough"
    t.boolean "sym_short_breath"
    t.boolean "sym_fatigue"
    t.boolean "sym_sore_throat"
    t.boolean "sym_runny_nose"
    t.boolean "sym_aches"
    t.boolean "sym_vomiting"
    t.boolean "sym_diarrhea"
    t.boolean "sym_none_of_these"
    t.index ["browser_uuid"], name: "index_readings_on_browser_uuid"
  end

  create_table "reminders", force: :cascade do |t|
    t.string "email"
    t.integer "hour_of_day"
    t.string "phone"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
