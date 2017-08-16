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

ActiveRecord::Schema.define(:version => 20160710085219) do

  create_table "categorizations", :force => true do |t|
    t.integer  "product_id"
    t.integer  "schedule_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "newcom"
  end

  create_table "engineers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "schedule_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "holidays", :force => true do |t|
    t.datetime "date"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pendings", :force => true do |t|
    t.datetime "date"
    t.integer  "company_id"
    t.text     "project"
    t.integer  "sale_id"
    t.integer  "status_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "pdf"
  end

  create_table "products", :force => true do |t|
    t.integer  "type_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sales", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schedules", :force => true do |t|
    t.text     "project"
    t.datetime "date"
    t.integer  "company_id"
    t.integer  "sale_id"
    t.integer  "location_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.integer  "all_day"
    t.string   "machine_number"
    t.string   "job_num"
    t.string   "company_name"
    t.datetime "end_date"
    t.integer  "chargable"
    t.integer  "timesheet_id"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "timesheets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "schedule_id"
    t.text     "data"
    t.text     "nil_sig"
    t.text     "cus_sig"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "sale_id"
    t.integer  "role_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "auth_token"
  end

end
