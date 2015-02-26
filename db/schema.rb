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

ActiveRecord::Schema.define(version: 20150123093600) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "addresses", force: true do |t|
    t.string   "city"
    t.integer  "postal_code"
    t.string   "street"
    t.string   "house_number"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beer_clubs", force: true do |t|
    t.integer  "beer_id"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "beer_clubs", ["beer_id"], name: "index_beer_clubs_on_beer_id"
  add_index "beer_clubs", ["club_id"], name: "index_beer_clubs_on_club_id"

  create_table "beers", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "producer_id"
    t.string   "beerURL"
  end

  add_index "beers", ["category_id"], name: "index_beers_on_category_id"
  add_index "beers", ["producer_id"], name: "index_beers_on_producer_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "address_id"
    t.boolean  "active"
    t.string   "clubURL"
    t.integer  "user_id"
  end

  create_table "criterions", force: true do |t|
    t.integer  "rating_id"
    t.string   "name"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.datetime "sdate"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imageURL"
  end

  add_index "events", ["club_id"], name: "index_events_on_club_id"

  create_table "producers", force: true do |t|
    t.string   "name"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "producers", ["address_id"], name: "index_producers_on_address_id"

  create_table "ratings", force: true do |t|
    t.integer  "beer_id"
    t.integer  "user_id"
    t.string   "headline"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "shop_beers", force: true do |t|
    t.integer  "shop_id"
    t.integer  "beer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price"
  end

  add_index "shop_beers", ["beer_id"], name: "index_shop_beers_on_beer_id"
  add_index "shop_beers", ["shop_id"], name: "index_shop_beers_on_shop_id"

  create_table "shops", force: true do |t|
    t.string   "name"
    t.integer  "address_id"
    t.string   "email"
    t.integer  "phonenumber"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "address_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
