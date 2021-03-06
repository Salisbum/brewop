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

ActiveRecord::Schema.define(version: 20160425145425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.string   "bottling_option", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "recipe_id",       null: false
    t.integer  "user_id",         null: false
    t.integer  "bottle_count",    null: false
    t.integer  "bottle_brewed",   null: false
    t.string   "batch_name",      null: false
    t.text     "batch_notes",     null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "recipe_id",  null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "user_id",   null: false
    t.string  "unit",      null: false
    t.float   "quantity",  null: false
    t.string  "item",      null: false
  end

  create_table "instructions", force: :cascade do |t|
    t.integer "recipe_id",     null: false
    t.integer "ingredient_id"
    t.integer "user_id",       null: false
    t.string  "unit",          null: false
    t.float   "quantity",      null: false
    t.integer "add_point",     null: false
    t.string  "temperature"
    t.string  "details"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",                  null: false
    t.string   "username",    default: "", null: false
    t.string   "avatar_url"
    t.string   "location"
    t.text     "brewop_name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.string   "name",        null: false
    t.string   "beer_type"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
