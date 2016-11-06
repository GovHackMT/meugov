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

ActiveRecord::Schema.define(version: 20161106131812) do

  create_table "cities", force: :cascade do |t|
    t.integer  "state_id",   limit: 4
    t.string   "name",       limit: 255
    t.integer  "population", limit: 4
    t.decimal  "pib",                    precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "latitude",   limit: 255
    t.string   "longitude",  limit: 255
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.integer  "user_id",          limit: 4
    t.text     "content",          limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.integer  "property_category_id", limit: 4
    t.string   "name",                 limit: 255
    t.string   "street",               limit: 255
    t.string   "number",               limit: 255
    t.string   "complement",           limit: 255
    t.string   "neighborhood",         limit: 255
    t.string   "cep",                  limit: 255
    t.integer  "city_id",              limit: 4
    t.float    "latitude",             limit: 24
    t.float    "longitude",            limit: 24
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "properties", ["city_id"], name: "index_properties_on_city_id", using: :btree
  add_index "properties", ["property_category_id"], name: "index_properties_on_property_category_id", using: :btree

  create_table "property_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "proposal_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "proposal_votes", force: :cascade do |t|
    t.integer  "proposal_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "answer",      limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "proposal_votes", ["proposal_id"], name: "index_proposal_votes_on_proposal_id", using: :btree
  add_index "proposal_votes", ["user_id"], name: "index_proposal_votes_on_user_id", using: :btree

  create_table "proposals", force: :cascade do |t|
    t.string   "title",                limit: 255
    t.text     "content",              limit: 65535
    t.integer  "user_id",              limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "street",               limit: 255
    t.string   "number",               limit: 255
    t.string   "complement",           limit: 255
    t.string   "neighborhood",         limit: 255
    t.string   "cep",                  limit: 255
    t.integer  "city_id",              limit: 4
    t.integer  "status",               limit: 4,     default: 0
    t.integer  "proposal_category_id", limit: 4
    t.float    "thermometer",          limit: 24
    t.integer  "proposal_votes_count", limit: 4,     default: 0
    t.integer  "count_views",          limit: 4,     default: 0
  end

  add_index "proposals", ["city_id"], name: "index_proposals_on_city_id", using: :btree
  add_index "proposals", ["proposal_category_id"], name: "index_proposals_on_proposal_category_id", using: :btree
  add_index "proposals", ["user_id"], name: "index_proposals_on_user_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "acronym",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.integer  "city_id",                limit: 4
    t.integer  "role",                   limit: 4
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
