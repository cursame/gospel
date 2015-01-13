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

ActiveRecord::Schema.define(version: 20150112231122) do

  create_table "networks", force: true do |t|
    t.string   "token_network"
    t.string   "network_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "steap"
    t.boolean  "finish_training"
    t.string   "subdomain",       default: "demo"
  end

  create_table "session_registers", force: true do |t|
    t.string "email"
    t.date   "session_date"
  end

  create_table "user_admins", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "role"
    t.string   "network_name"
    t.string   "type_network"
    t.date     "loggin_first"
    t.date     "last_loggin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "steap"
    t.boolean  "finish_training", default: false
    t.string   "subdomain",       default: "demo"
  end

end
