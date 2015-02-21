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

ActiveRecord::Schema.define(version: 20150218215541) do

  create_table "countries", force: :cascade do |t|
    t.integer  "map_id",      limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "creator_id",  limit: 4
    t.integer  "updater_id",  limit: 4
  end

  add_index "countries", ["map_id"], name: "index_countries_on_map_id", using: :btree

  create_table "hexes", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "map_id",      limit: 4
    t.integer  "country_id",  limit: 4
    t.integer  "province_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "creator_id",  limit: 4
    t.integer  "updater_id",  limit: 4
    t.string   "image",       limit: 255
    t.string   "background",  limit: 255
    t.string   "overlay",     limit: 255
    t.integer  "x",           limit: 4
    t.integer  "y",           limit: 4
    t.string   "local_image", limit: 255
  end

  add_index "hexes", ["country_id"], name: "index_hexes_on_country_id", using: :btree
  add_index "hexes", ["map_id"], name: "index_hexes_on_map_id", using: :btree
  add_index "hexes", ["province_id"], name: "index_hexes_on_province_id", using: :btree

  create_table "maps", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "creator_id",  limit: 4
    t.integer  "updater_id",  limit: 4
    t.integer  "length",      limit: 4
    t.integer  "width",       limit: 4
  end

  create_table "provinces", force: :cascade do |t|
    t.integer  "country_id",  limit: 4
    t.integer  "map_id",      limit: 4
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "creator_id",  limit: 4
    t.integer  "updater_id",  limit: 4
  end

  add_index "provinces", ["country_id"], name: "index_provinces_on_country_id", using: :btree
  add_index "provinces", ["map_id"], name: "index_provinces_on_map_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
