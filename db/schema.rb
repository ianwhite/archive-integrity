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

ActiveRecord::Schema.define(version: 20151202145024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "films", force: :cascade do |t|
    t.string  "title"
    t.integer "year"
    t.float   "freshness"
    t.string  "director"
    t.string  "country"
    t.string  "certificate"
    t.string  "image_uid"
    t.string  "imdb_id"
    t.string  "tmdb_id"
    t.string  "tmdb_image"
    t.string  "corner_event_id"
    t.string  "tmdb_backdrop"
    t.float   "popularity"
    t.float   "vote_average"
    t.integer "vote_count"
  end

  create_table "interactions", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.integer  "film_id",          null: false
    t.integer  "interaction_type", null: false
    t.integer  "value",            null: false
    t.datetime "updated_at",       null: false
    t.datetime "created_at",       null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string  "session_id"
    t.string  "name"
    t.boolean "critic",     default: false, null: false
  end

end
