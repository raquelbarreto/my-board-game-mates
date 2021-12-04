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

ActiveRecord::Schema.define(version: 2021_12_04_011254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "game_reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["game_id"], name: "index_game_reviews_on_game_id"
    t.index ["user_id"], name: "index_game_reviews_on_user_id"
  end

  create_table "game_sessions", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.boolean "is_smoke_free", null: false
    t.boolean "is_family_friendly", null: false
    t.boolean "has_drinks", null: false
    t.boolean "has_food", null: false
    t.integer "capacity"
    t.boolean "is_recurrent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "session_name"
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.text "description"
    t.datetime "starts_at"
    t.index ["game_id"], name: "index_game_sessions_on_game_id"
    t.index ["user_id"], name: "index_game_sessions_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "description"
    t.string "age_rating"
    t.string "player_count"
    t.string "category"
    t.integer "duration"
  end

  create_table "lobbies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_session_id", null: false
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_session_id"], name: "index_lobbies_on_game_session_id"
    t.index ["user_id"], name: "index_lobbies_on_user_id"
  end

  create_table "user_reviews", force: :cascade do |t|
    t.bigint "recepient_id", null: false
    t.bigint "author_id", null: false
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["author_id"], name: "index_user_reviews_on_author_id"
    t.index ["recepient_id"], name: "index_user_reviews_on_recepient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.text "about_me"
    t.string "address"
    t.integer "age"
    t.string "gender"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "game_reviews", "games"
  add_foreign_key "game_reviews", "users"
  add_foreign_key "game_sessions", "games"
  add_foreign_key "game_sessions", "users"
  add_foreign_key "lobbies", "game_sessions"
  add_foreign_key "lobbies", "users"
end
