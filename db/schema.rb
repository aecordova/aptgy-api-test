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

ActiveRecord::Schema.define(version: 2020_08_09_225619) do

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "recipient_id", null: false
    t.integer "gift_type"
    t.integer "quantity"
    t.boolean "notify_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["recipient_id"], name: "index_order_items_on_recipient_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "school_id", null: false
    t.integer "status", default: 1
    t.date "date"
    t.boolean "notify_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_orders_on_school_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.integer "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_recipients_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "recipients"
  add_foreign_key "orders", "schools"
  add_foreign_key "recipients", "schools"
end
