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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110224034608) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.integer  "band_id"
    t.string   "year"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label"
  end

  create_table "band_events", :force => true do |t|
    t.date     "date"
    t.integer  "order"
    t.string   "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "band_id"
    t.integer  "event_id"
  end

  create_table "band_memberships", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "band_id"
  end

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.string   "start_year"
    t.string   "end_year"
    t.string   "city"
    t.string   "state"
    t.text     "description"
    t.string   "homepage"
    t.string   "store_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "band_membership_id"
    t.string   "image"
    t.string   "genre"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "myspace"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "time"
    t.string   "cost"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
    t.string   "image"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "songs", :force => true do |t|
    t.integer  "album_id"
    t.string   "name"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mp3"
    t.integer  "band_id"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
    t.text     "description"
    t.string   "image"
    t.integer  "band_membership_id"
    t.string   "instrument"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "myspace"
    t.boolean  "editor",             :default => false
    t.boolean  "superuser",          :default => false
    t.boolean  "can_login",          :default => true
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "hours"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
    t.text     "homepage"
    t.string   "image"
  end

end
