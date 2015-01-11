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

ActiveRecord::Schema.define(version: 20150111155529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "question_id", null: false
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "details", force: true do |t|
    t.integer  "user_id",             null: false
    t.string   "orientation"
    t.string   "ethnicity"
    t.integer  "height"
    t.string   "body_type"
    t.string   "diet"
    t.string   "smokes"
    t.string   "drinks"
    t.string   "drugs"
    t.string   "religion"
    t.string   "sign"
    t.string   "education"
    t.string   "job"
    t.string   "income"
    t.string   "relationship_status"
    t.string   "relationship_type"
    t.string   "offspring"
    t.string   "pets"
    t.text     "languages"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "details", ["user_id"], name: "index_details_on_user_id", unique: true, using: :btree

  create_table "likes", force: true do |t|
    t.integer  "liker_id",   null: false
    t.integer  "likee_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["likee_id"], name: "index_likes_on_likee_id", using: :btree
  add_index "likes", ["liker_id"], name: "index_likes_on_liker_id", using: :btree

  create_table "matches", force: true do |t|
    t.integer  "matcher_id"
    t.integer  "matchee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["matchee_id"], name: "index_matches_on_matchee_id", using: :btree
  add_index "matches", ["matcher_id"], name: "index_matches_on_matcher_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.text     "title",       null: false
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "preferences", force: true do |t|
    t.string   "target_people"
    t.string   "target_age_range"
    t.string   "target_location"
    t.string   "target_purpose"
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

  create_table "questions", force: true do |t|
    t.text     "prompt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_answers", force: true do |t|
    t.integer  "user_id",     null: false
    t.integer  "answer_id",   null: false
    t.integer  "question_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_answers", ["answer_id"], name: "index_user_answers_on_answer_id", using: :btree
  add_index "user_answers", ["question_id"], name: "index_user_answers_on_question_id", using: :btree
  add_index "user_answers", ["user_id"], name: "index_user_answers_on_user_id", using: :btree

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
