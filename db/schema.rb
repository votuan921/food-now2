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

ActiveRecord::Schema.define(version: 2019_09_08_041253) do

  create_table "bill_details", force: :cascade do |t|
    t.integer "bill_id"
    t.string "bill_detailable_type"
    t.integer "bill_detailable_id"
    t.integer "count"
    t.float "price"
    t.index ["bill_detailable_type", "bill_detailable_id"], name: "bill_detailable_index"
    t.index ["bill_id"], name: "index_bill_details_on_bill_id"
  end

  create_table "bills", force: :cascade do |t|
    t.integer "status", default: 1
    t.integer "user_id"
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.index ["store_id"], name: "index_bills_on_store_id"
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "combo_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "combo_id"
    t.integer "count"
    t.index ["combo_id"], name: "index_combo_products_on_combo_id"
    t.index ["product_id"], name: "index_combo_products_on_product_id"
  end

  create_table "combos", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 1
    t.float "price"
    t.integer "store_id"
    t.index ["store_id"], name: "index_combos_on_store_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "parent_comment_id", default: 0
    t.integer "user_id"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["parent_comment_id"], name: "index_comments_on_parent_comment_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.integer "province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_districts_on_province_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.string "alt"
    t.integer "image_type"
    t.string "imageable_type"
    t.integer "imageable_id"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "status", default: 1
    t.integer "store_id"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.integer "user_id"
    t.integer "district_id"
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_stores_on_district_id"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.text "image"
    t.integer "cost"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
