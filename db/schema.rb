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

ActiveRecord::Schema.define(version: 20170720222211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendees_on_event_id", using: :btree
    t.index ["user_id"], name: "index_attendees_on_user_id", using: :btree
  end

  create_table "custom_fields", force: :cascade do |t|
    t.integer  "type"
    t.string   "name"
    t.string   "options"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "placeholder"
  end

  create_table "dynamic_fields", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "custom_field_id"
    t.integer  "user_id"
    t.string   "value"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["custom_field_id"], name: "index_dynamic_fields_on_custom_field_id", using: :btree
    t.index ["event_id"], name: "index_dynamic_fields_on_event_id", using: :btree
    t.index ["user_id"], name: "index_dynamic_fields_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "image_id"
    t.string   "image_filename"
    t.datetime "starts_at"
    t.datetime "finishes_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "slug"
    t.text     "label_xml"
    t.boolean  "pre_register",   default: false
    t.integer  "boletia_id"
    t.index ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "image_url"
    t.integer  "role",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "company"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "attendees", "events"
  add_foreign_key "attendees", "users"
  add_foreign_key "dynamic_fields", "custom_fields"
  add_foreign_key "dynamic_fields", "events"
  add_foreign_key "dynamic_fields", "users"
end
