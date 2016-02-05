# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160205204507) do

  create_table "foods", force: :cascade do |t|
    t.string   "food_name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "truck_id"
    t.decimal  "price"
  end

  add_index "foods", ["truck_id"], name: "index_foods_on_truck_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "truck_id"
    t.string   "item1"
    t.string   "item2"
    t.string   "item3"
    t.string   "item4"
    t.string   "item5"
    t.string   "item6"
    t.string   "item7"
    t.string   "item8"
    t.string   "item9"
    t.string   "item10"
    t.boolean  "confirm",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "orders", ["truck_id"], name: "index_orders_on_truck_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "trucks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "fname"
    t.string   "lname"
    t.datetime "birthday"
    t.string   "street_address"
    t.string   "state"
    t.string   "city"
    t.integer  "zip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "truck_owner",     default: false
    t.float    "latitude"
    t.float    "longitude"
  end

end
