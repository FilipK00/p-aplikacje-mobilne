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

ActiveRecord::Schema[7.0].define(version: 2022_06_06_215552) do
  create_table "petrol_stations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_dates", force: :cascade do |t|
    t.string "title"
    t.integer "user_id", null: false
    t.integer "petrol_station_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["petrol_station_id"], name: "index_post_dates_on_petrol_station_id"
    t.index ["user_id"], name: "index_post_dates_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.float "pb_price"
    t.float "diesel_price"
    t.integer "user_id", null: false
    t.integer "petrol_station_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_dates_id"
    t.integer "post_date_id"
    t.index ["petrol_station_id"], name: "index_posts_on_petrol_station_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "index"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "token"
    t.index ["index"], name: "index_users_on_index", unique: true
    t.index ["token"], name: "index_users_on_token"
  end

  create_table "users_petrol_stations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "post_date_id"
  end

  add_foreign_key "post_dates", "petrol_stations"
  add_foreign_key "post_dates", "users"
  add_foreign_key "posts", "petrol_stations"
  add_foreign_key "posts", "users"
end
