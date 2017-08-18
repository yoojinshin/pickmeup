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

ActiveRecord::Schema.define(version: 20170816143613) do

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.string   "userEmail"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "companyName"
    t.string   "companyPhone"
    t.string   "companyNum"
    t.string   "imageURL"
    t.string   "menuURL"
    t.string   "storeURL"
    t.integer  "numStaff"
    t.integer  "companyBirth"
    t.text     "companyAddress"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "userEmail"
    t.string   "companyIntro"
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "requests", force: :cascade do |t|
    t.boolean  "ago"
    t.string   "userEmail"
    t.string   "styleAgo"
    t.text     "detailAgo"
    t.string   "backURL"
    t.string   "frontURL"
    t.string   "damageURL"
    t.string   "style"
    t.text     "detail"
    t.text     "wannaGo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reserves", force: :cascade do |t|
    t.string   "customerEmail"
    t.string   "companyEmail"
    t.string   "type"
    t.integer  "response"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "responses", force: :cascade do |t|
    t.string   "companyName"
    t.integer  "request_id"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "companyURL"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "reviewType"
    t.string   "title"
    t.string   "userEmail"
    t.text     "content"
    t.string   "imageURL"
    t.integer  "hits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "userType"
    t.string   "email"
    t.string   "password_digest"
    t.string   "userName"
    t.string   "phoneNum"
    t.integer  "birth"
    t.string   "gender"
    t.text     "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
