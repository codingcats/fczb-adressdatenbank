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

ActiveRecord::Schema.define(version: 20150203103623) do

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "institution_id"
    t.string   "form_of_address"
    t.string   "position"
    t.string   "landline"
    t.string   "mobile"
    t.string   "fax"
    t.datetime "deleted_at"
  end

  add_index "contacts", ["deleted_at"], name: "index_contacts_on_deleted_at"

  create_table "contacts_occasions", id: false, force: true do |t|
    t.integer "contact_id",  null: false
    t.integer "occasion_id", null: false
  end

  create_table "emails", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_id"
    t.datetime "deleted_at"
  end

  add_index "emails", ["deleted_at"], name: "index_emails_on_deleted_at"

  create_table "institutions", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.integer  "postcode",   limit: 255
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.string   "comment"
    t.datetime "deleted_at"
  end

  add_index "institutions", ["deleted_at"], name: "index_institutions_on_deleted_at"

  create_table "occasions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "dispatch_mode"
    t.datetime "deleted_at"
  end

  add_index "occasions", ["deleted_at"], name: "index_occasions_on_deleted_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

end
