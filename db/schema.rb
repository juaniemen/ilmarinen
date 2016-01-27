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

ActiveRecord::Schema.define(version: 20160125104438) do

  create_table "answers", force: :cascade do |t|
    t.string   "question",   limit: 255
    t.string   "option",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "vote_id", limit: 4
  end

  add_index "answers", ["vote_id"], name: "index_answers_on_vote_id", using: :btree

  create_table "count_cps", force: :cascade do |t|
    t.integer  "cp",         limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "counts", force: :cascade do |t|
    t.string   "question",    limit: 255
    t.string   "option",      limit: 255
    t.integer  "optionCount", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "poll_rec_id", limit: 4
  end

  add_index "counts", ["poll_rec_id"], name: "index_counts_on_poll_rec_id", using: :btree

  create_table "general_counts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "poll_recs", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.datetime "lastModification"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "cp",         limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "poll_id",    limit: 4
  end

  add_index "votes", ["poll_id"], name: "index_votes_on_poll_id", using: :btree

  create_table "polls", force: :cascade do |t|
    t.string   "name",       limit: 255
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree



  add_foreign_key "counts", "poll_recs"
  add_foreign_key "votes", "polls"
  add_foreign_key "answers", "votes"
end
