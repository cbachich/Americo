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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130823134642) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "companies", :force => true do |t|
    t.string   "title"
    t.string   "phone"
    t.string   "fax"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "subtitle"
    t.text     "summary",    :limit => 255
    t.string   "logo"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.text     "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "title"
    t.boolean  "reversed",          :default => false
    t.integer  "sheet_id"
    t.string   "short_description"
    t.text     "description"
    t.string   "banner_image"
  end

  create_table "pictures", :force => true do |t|
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
    t.string   "title"
    t.text     "details"
  end

  add_index "pictures", ["page_id"], :name => "index_pictures_on_page_id"

  create_table "quotes", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.text     "comments"
    t.string   "attachment_1"
    t.string   "attachment_2"
    t.string   "attachment_3"
    t.string   "attachment_4"
    t.string   "attachment_5"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sheets", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
    t.string   "subtitle"
  end

  add_index "sheets", ["company_id"], :name => "index_sheets_on_company_id"

end
