# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_10_213344) do

  create_table "gas_types", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.date "from"
    t.date "to"
    t.decimal "price"
    t.integer "zone_id"
    t.integer "gas_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gas_type_id"], name: "index_prices_on_gas_type_id"
    t.index ["zone_id"], name: "index_prices_on_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
