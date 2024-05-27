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

ActiveRecord::Schema[7.0].define(version: 2024_05_25_190127) do
  create_table "currents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examples", force: :cascade do |t|
    t.string "name"
    t.integer "ssn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.string "favoritable_type"
    t.integer "favoritable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favoritable_id"], name: "index_favorites_on_favoritable_id"
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable"
  end

  create_table "flops", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentions", force: :cascade do |t|
    t.integer "mentionable_id"
    t.string "mentionable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentionable_id"], name: "index_mentions_on_mentionable_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "year_released"
    t.integer "budget"
    t.float "worldwide_gross"
    t.string "imdb_id"
    t.string "description"
    t.string "content_rating"
    t.integer "movie_length"
    t.float "rating"
    t.string "trailer"
    t.string "plot"
    t.string "banner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "popular_flops", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_popular_flops_on_movie_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.integer "reply_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
