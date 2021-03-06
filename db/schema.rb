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

ActiveRecord::Schema.define(version: 20160806095754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "ancestry"
    t.integer  "my_parent_id"
  end

  add_index "employees", ["ancestry"], name: "index_employees_on_ancestry", using: :btree
  add_index "employees", ["my_parent_id"], name: "index_employees_on_my_parent_id", using: :btree

  create_table "worker_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "worker_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "worker_anc_desc_idx", unique: true, using: :btree
  add_index "worker_hierarchies", ["descendant_id"], name: "worker_desc_idx", using: :btree

  create_table "workers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  add_index "workers", ["parent_id"], name: "index_workers_on_parent_id", using: :btree

end
