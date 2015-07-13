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

ActiveRecord::Schema.define(version: 20150713113706) do

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "region_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "moods", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.text     "about",       limit: 65535
    t.integer  "mood_id",     limit: 4
    t.integer  "zodiak_id",   limit: 4
    t.text     "interesting", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "questionaries", force: :cascade do |t|
    t.integer  "age",         limit: 4
    t.integer  "seek_gender", limit: 4
    t.integer  "height",      limit: 4
    t.integer  "weight",      limit: 4
    t.integer  "city_id",     limit: 4
    t.integer  "region_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 255
    t.string   "password_digest",  limit: 255
    t.integer  "role",             limit: 4
    t.integer  "gender",           limit: 4
    t.boolean  "is_email_confirm", limit: 1
    t.string   "avatar",           limit: 255
    t.string   "name",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "remember_digest",  limit: 255
  end

end
