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

ActiveRecord::Schema.define(version: 20140123093427) do

  create_table "accounts", force: true do |t|
    t.string   "plan",                       default: "free"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "role",                       default: "user"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "activated"
    t.string   "activation_code", limit: 40
    t.datetime "activated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", force: true do |t|
    t.string   "from"
    t.string   "to"
    t.integer  "last_send_attempt", default: 0
    t.text     "mail"
    t.datetime "created_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "location"
    t.string   "venue"
    t.string   "artist"
    t.text     "body"
    t.string   "link"
    t.string   "permalink"
    t.datetime "start_date"
    t.datetime "start_time"
    t.datetime "end_date"
    t.datetime "end_time"
    t.datetime "opening_date"
    t.datetime "opening_time"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
  end

  create_table "express_post_offices", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.boolean  "sent",       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "post_offices", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stream_id"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "streams", force: true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "post_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "streamer_id"
    t.string   "streamer_type"
  end

  create_table "styles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.string   "something"
    t.string   "content_background",      default: "#FFF"
    t.string   "side_panel_background",   default: "#FFF"
    t.string   "left_panel_background",   default: "#FFF"
    t.string   "p",                       default: "#000"
    t.string   "h1",                      default: "#666"
    t.string   "h2",                      default: "#999"
    t.string   "h3",                      default: "#CCC"
    t.string   "a",                       default: "#333"
    t.string   "background_color",        default: "#EAEAEA"
    t.string   "page_color",              default: "#FFFFFF"
  end

  create_table "terms", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "themes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "permalink"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                default: "user"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "activation_code"
    t.datetime "activated_at"
    t.string   "email"
    t.string   "persona",             default: "creative"
    t.string   "blank",               default: ""
  end

end
