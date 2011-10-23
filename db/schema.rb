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

ActiveRecord::Schema.define(:version => 20111022133435) do

  create_table "admins", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "assignments", :force => true do |t|
    t.integer  "topic_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.string   "poster"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.string   "map"
    t.text     "program"
    t.integer  "capacity"
    t.string   "audience"
    t.string   "registration_notice"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_lecturers", :force => true do |t|
    t.integer  "course_id"
    t.integer  "lecturer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.boolean  "verified"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lecturers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.string   "occupation"
    t.string   "affiliation"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "resource_file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resource_container_id"
    t.string   "resource_container_type"
  end

  create_table "solutions", :force => true do |t|
    t.integer  "assignment_id"
    t.integer  "student_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "students", ["email"], :name => "index_students_on_email", :unique => true
  add_index "students", ["reset_password_token"], :name => "index_students_on_reset_password_token", :unique => true

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.datetime "date"
    t.integer  "course_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topic_order"
  end

end
