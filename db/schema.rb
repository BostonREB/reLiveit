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

ActiveRecord::Schema.define(version: 20140514141807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "following_artist_relationships", force: true do |t|
    t.integer  "followed_artist_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "following_artist_relationships", ["followed_artist_id"], name: "index_following_artist_relationships_on_followed_artist_id", using: :btree
  add_index "following_artist_relationships", ["follower_id"], name: "index_following_artist_relationships_on_follower_id", using: :btree

  create_table "recordings", force: true do |t|
    t.string   "identifier"
    t.string   "date"
    t.string   "title"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "collection"
    t.string   "upload_date"
  end

  add_index "recordings", ["artist_id"], name: "index_recordings_on_artist_id", using: :btree

  create_table "shows", force: true do |t|
    t.integer  "artist_id"
    t.string   "city"
    t.string   "venue"
    t.string   "date"
    t.string   "uri"
    t.integer  "songkick_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "artist_name"
  end

  add_index "shows", ["artist_id"], name: "index_shows_on_artist_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "email",                                                 null: false
    t.string   "encrypted_password", limit: 128,                        null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,                        null: false
    t.string   "city"
    t.string   "state"
    t.string   "songkick_api_date",              default: "2014-01-01"
    t.string   "lma_api_date",                   default: "2014-01-01"
    t.boolean  "gets_email",                     default: false,        null: false
    t.string   "zip"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
