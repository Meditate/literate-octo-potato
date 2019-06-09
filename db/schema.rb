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

ActiveRecord::Schema.define(version: 20190609143849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frames", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "game_id"
    t.integer  "position"
    t.index ["game_id"], name: "index_frames_on_game_id", using: :btree
    t.index ["user_id"], name: "index_frames_on_user_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "key",                       null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "frames_count", default: 10, null: false
    t.index ["key"], name: "index_games_on_key", unique: true, using: :btree
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "value",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.integer  "game_id"
    t.index ["game_id"], name: "index_scores_on_game_id", using: :btree
    t.index ["user_id"], name: "index_scores_on_user_id", using: :btree
  end

  create_table "sequences", force: :cascade do |t|
    t.integer  "status",           default: 0, null: false
    t.integer  "number_of_throws", default: 2, null: false
    t.integer  "frame_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["frame_id"], name: "index_sequences_on_frame_id", using: :btree
  end

  create_table "sequences_throws", force: :cascade do |t|
    t.integer  "throw_id"
    t.integer  "sequence_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sequence_id"], name: "index_sequences_throws_on_sequence_id", using: :btree
    t.index ["throw_id"], name: "index_sequences_throws_on_throw_id", using: :btree
  end

  create_table "throws", force: :cascade do |t|
    t.integer  "score",          default: 0, null: false
    t.string   "presentation"
    t.integer  "frame_id"
    t.integer  "attempt_number", default: 1, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["frame_id"], name: "index_throws_on_frame_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "api_key",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_users_on_api_key", unique: true, using: :btree
  end

  add_foreign_key "frames", "games"
  add_foreign_key "frames", "users"
  add_foreign_key "scores", "games"
  add_foreign_key "scores", "users"
  add_foreign_key "sequences", "frames"
  add_foreign_key "sequences_throws", "sequences"
  add_foreign_key "sequences_throws", "throws"
  add_foreign_key "throws", "frames"
end
