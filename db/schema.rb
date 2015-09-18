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

  create_table "big_concert_bands", force: true do |t|
    t.string   "name",        null: false
    t.string   "leader",      null: false
    t.string   "vo"
    t.string   "gt1"
    t.string   "gt2"
    t.string   "ba"
    t.string   "dr"
    t.string   "key"
    t.boolean  "day1"
    t.boolean  "day2"
    t.boolean  "day3"
    t.boolean  "day4"
    t.text     "description"
    t.integer  "year"
    t.integer  "season"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "big_concerts", force: true do |t|
    t.integer  "year",                      null: false
    t.integer  "season",                    null: false
    t.boolean  "can_edit",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "small_concert_bands", force: true do |t|
    t.string   "name",        null: false
    t.string   "song",        null: false
    t.string   "leader",      null: false
    t.string   "vo"
    t.string   "gt1"
    t.string   "gt2"
    t.string   "ba"
    t.string   "dr"
    t.string   "key"
    t.boolean  "week1"
    t.boolean  "week2"
    t.text     "description"
    t.integer  "year"
    t.integer  "month"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "small_concerts", force: true do |t|
    t.integer  "year",                      null: false
    t.integer  "month",                     null: false
    t.boolean  "can_edit",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "authority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "role_flag"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
