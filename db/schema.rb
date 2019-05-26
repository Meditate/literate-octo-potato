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

ActiveRecord::Schema.define(version: 20190526175312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frames", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status",     default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_frames_on_user_id", using: :btree
  end

  create_table "sequences", force: :cascade do |t|
    t.integer  "status",           default: 0, null: false
    t.integer  "number_of_throws", default: 2, null: false
    t.integer  "frame_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["frame_id"], name: "index_sequences_on_frame_id", using: :btree
  end

  create_table "throws", force: :cascade do |t|
    t.integer  "score",          default: 0, null: false
    t.string   "presentation"
    t.integer  "frame_id"
    t.integer  "attempt_number",             null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["frame_id"], name: "index_throws_on_frame_id", using: :btree
  end

  create_table "throws_sequences", force: :cascade do |t|
    t.integer  "throw_id"
    t.integer  "sequence_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sequence_id"], name: "index_throws_sequences_on_sequence_id", using: :btree
    t.index ["throw_id"], name: "index_throws_sequences_on_throw_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "api_key",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_users_on_api_key", unique: true, using: :btree
  end

  add_foreign_key "frames", "users"
  add_foreign_key "sequences", "frames"
  add_foreign_key "throws", "frames"
  add_foreign_key "throws_sequences", "sequences"
  add_foreign_key "throws_sequences", "throws"
end
