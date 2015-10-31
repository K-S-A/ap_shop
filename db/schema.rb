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

ActiveRecord::Schema.define(version: 20151008162950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arrivals", force: :cascade do |t|
    t.integer  "roll_id"
    t.date     "arrival_date"
    t.decimal  "total",        precision: 5, scale: 2
    t.string   "info"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "arrivals", ["roll_id"], name: "index_arrivals_on_roll_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "roll_id"
    t.decimal  "amount_ordered", precision: 5, scale: 2
    t.decimal  "price_sold",     precision: 5, scale: 2
    t.string   "item_comment"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["roll_id"], name: "index_order_items_on_roll_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.date     "order_date"
    t.string   "number"
    t.string   "customer"
    t.string   "customer_phone"
    t.string   "status"
    t.string   "order_comment"
    t.decimal  "prepay",         precision: 8, scale: 2
    t.decimal  "discount",       precision: 6, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "rolls", force: :cascade do |t|
    t.string   "suffix"
    t.string   "location"
    t.text     "comment"
    t.integer  "textile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rolls", ["textile_id"], name: "index_rolls_on_textile_id", using: :btree

  create_table "store_receipts", force: :cascade do |t|
    t.integer  "order_item_id"
    t.decimal  "receipt_amount", precision: 5, scale: 2
    t.date     "receipt_date"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "store_receipts", ["order_item_id"], name: "index_store_receipts_on_order_item_id", using: :btree

  create_table "textiles", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "country"
    t.string   "manufacturer"
    t.string   "man_code"
    t.integer  "height"
    t.string   "units"
    t.decimal  "price",        precision: 5, scale: 2
    t.integer  "group_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "textiles", ["group_id"], name: "index_textiles_on_group_id", using: :btree

  add_foreign_key "arrivals", "rolls"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "rolls"
  add_foreign_key "rolls", "textiles"
  add_foreign_key "store_receipts", "order_items"
  add_foreign_key "textiles", "groups"
end
