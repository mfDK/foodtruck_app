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

ActiveRecord::Schema.define(version: 20160213220332) do

  create_table "foodorders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "foodorders", ["food_id"], name: "index_foodorders_on_food_id"
  add_index "foodorders", ["order_id"], name: "index_foodorders_on_order_id"

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
    t.boolean  "confirm",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "orders", ["truck_id"], name: "index_orders_on_truck_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "trucks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "street_address"
    t.integer  "user_id"
  end

  add_index "trucks", ["user_id"], name: "index_trucks_on_user_id"

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
    t.string   "country"
  end

end
