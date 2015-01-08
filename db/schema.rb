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

ActiveRecord::Schema.define(version: 20150108030430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: true do |t|
    t.integer  "liker_id",   null: false
    t.integer  "likee_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["likee_id"], name: "index_likes_on_likee_id", using: :btree
  add_index "likes", ["liker_id"], name: "index_likes_on_liker_id", using: :btree

  create_table "preferences", force: true do |t|
    t.string   "target_people",    null: false
    t.string   "target_age_range", null: false
    t.string   "target_location",  null: false
    t.string   "target_purpose",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",          null: false
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", unique: true, using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id",    null: false
    t.text     "self_sum"
    t.text     "life_sum"
    t.text     "skills"
    t.text     "favorites"
    t.text     "needs"
    t.text     "thoughts"
    t.text     "fun_acts"
    t.text     "msg_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.boolean  "searchable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "orientation",     null: false
    t.string   "gender",          null: false
    t.string   "country",         null: false
    t.integer  "zip_code",        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["searchable"], name: "index_users_on_searchable", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
