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

ActiveRecord::Schema[7.1].define(version: 2024_04_21_071840) do
  create_table "authors", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name"
    t.datetime "date_of_birth"
    t.string "place_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_details", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.decimal "price", precision: 10, null: false
    t.integer "quantity", null: false
    t.bigint "booking_id", null: false
    t.bigint "product_detail_id", null: false
    t.datetime "delete_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_details_on_booking_id"
    t.index ["product_detail_id"], name: "index_booking_details_on_product_detail_id"
  end

  create_table "bookings", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "address", null: false
    t.string "phone", null: false
    t.boolean "status", default: false
    t.string "email", null: false
    t.string "full_name", null: false
    t.datetime "booking_date", null: false
    t.bigint "user_id", null: false
    t.datetime "delete_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "books", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "title"
    t.integer "pages"
    t.float "rating"
    t.integer "year_published"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "evaluates", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "content", null: false
    t.string "email", null: false
    t.string "full_name", null: false
    t.integer "stars", null: false
    t.datetime "evaluate_date", null: false
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_evaluates_on_product_id"
    t.index ["user_id"], name: "index_evaluates_on_user_id"
  end

  create_table "product_details", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.decimal "price", precision: 10, null: false
    t.text "profile", null: false
    t.integer "quantity", null: false
    t.float "weight", null: false
    t.bigint "product_id", null: false
    t.datetime "delete_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_details_on_product_id"
  end

  create_table "product_types", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.text "benefit"
    t.text "evaluate"
    t.text "information"
    t.text "instruct"
    t.datetime "delete_at"
    t.text "note"
    t.string "name", null: false
    t.string "trademark", null: false
    t.bigint "product_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_events", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "title", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_role_details", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_role_details_on_role_id"
    t.index ["user_id"], name: "index_user_role_details_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name", null: false
    t.datetime "delete_at"
    t.string "password_digest", null: false
    t.string "profile"
    t.string "user_name", null: false
    t.decimal "point", precision: 10, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "booking_details", "bookings"
  add_foreign_key "booking_details", "product_details"
  add_foreign_key "bookings", "users"
  add_foreign_key "books", "authors"
  add_foreign_key "evaluates", "products"
  add_foreign_key "evaluates", "users"
  add_foreign_key "product_details", "products"
  add_foreign_key "products", "product_types"
  add_foreign_key "user_role_details", "roles"
  add_foreign_key "user_role_details", "users"
end
