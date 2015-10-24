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

ActiveRecord::Schema.define(version: 20150918081939) do

  create_table "big_concert_bands", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.string   "leader",      limit: 255,   null: false
    t.string   "vo",          limit: 255
    t.string   "gt1",         limit: 255
    t.string   "gt2",         limit: 255
    t.string   "ba",          limit: 255
    t.string   "dr",          limit: 255
    t.string   "key",         limit: 255
    t.boolean  "day1",        limit: 1
    t.boolean  "day2",        limit: 1
    t.boolean  "day3",        limit: 1
    t.boolean  "day4",        limit: 1
    t.text     "description", limit: 65535
    t.integer  "year",        limit: 4
    t.integer  "season",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     limit: 4
  end

  create_table "big_concerts", force: :cascade do |t|
    t.integer  "year",       limit: 4,                null: false
    t.integer  "season",     limit: 4,                null: false
    t.boolean  "can_edit",   limit: 1, default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "big_concerts", ["year", "season"], name: "index_big_concerts_on_year_and_season", unique: true, using: :btree

  create_table "small_concert_bands", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.string   "song",        limit: 255,   null: false
    t.string   "leader",      limit: 255,   null: false
    t.string   "vo",          limit: 255
    t.string   "gt1",         limit: 255
    t.string   "gt2",         limit: 255
    t.string   "ba",          limit: 255
    t.string   "dr",          limit: 255
    t.string   "key",         limit: 255
    t.boolean  "week1",       limit: 1
    t.boolean  "week2",       limit: 1
    t.text     "description", limit: 65535
    t.integer  "year",        limit: 4
    t.integer  "month",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     limit: 4
  end

  create_table "small_concerts", force: :cascade do |t|
    t.integer  "year",       limit: 4,                null: false
    t.integer  "month",      limit: 4,                null: false
    t.boolean  "can_edit",   limit: 1, default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "small_concerts", ["year", "month"], name: "index_small_concerts_on_year_and_month", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "authority",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
    t.boolean  "role_flag",       limit: 1
    t.string   "remember_token",  limit: 255
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
