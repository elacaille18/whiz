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

ActiveRecord::Schema.define(version: 20160524181300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "missions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.string   "receiver_first_name"
    t.string   "receiver_last_name"
    t.string   "receiver_phone"
    t.string   "departure_city"
    t.string   "arrival_city"
    t.date     "starts_on"
    t.string   "timeslot"
    t.string   "status"
    t.string   "start_code"
    t.string   "end_code"
    t.float    "price"
    t.string   "parcel_description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "receiver_email"
  end

  add_index "missions", ["trip_id"], name: "index_missions_on_trip_id", using: :btree
  add_index "missions", ["user_id"], name: "index_missions_on_user_id", using: :btree

  create_table "segments", force: :cascade do |t|
    t.integer  "trip_id"
    t.string   "departure_city"
    t.string   "departure_station"
    t.datetime "leaves_at"
    t.string   "arrival_city"
    t.string   "arrival_station"
    t.datetime "arrives_at"
    t.integer  "train_number"
    t.string   "sequence_number"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "segments", ["trip_id"], name: "index_segments_on_trip_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "departure_city"
    t.string   "arrival_city"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "missions", "trips"
  add_foreign_key "missions", "users"
  add_foreign_key "segments", "trips"
  add_foreign_key "trips", "users"
end
