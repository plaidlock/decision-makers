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

ActiveRecord::Schema.define(:version => 20110701031614) do

  create_table "assignments", :force => true do |t|
    t.integer  "scholar_id"
    t.integer  "profile_id"
    t.datetime "assigned"
    t.datetime "started"
    t.datetime "completed"
  end

  add_index "assignments", ["profile_id"], :name => "index_assignments_on_profile_id"
  add_index "assignments", ["scholar_id"], :name => "index_assignments_on_scholar_id"

  create_table "klasses", :force => true do |t|
    t.string   "name"
    t.string   "default_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string "name"
    t.text   "text"
  end

  add_index "profiles", ["name"], :name => "index_profiles_on_name"

  create_table "questions", :force => true do |t|
    t.integer "snapshot_id"
    t.text    "question"
    t.string  "category"
    t.integer "display_order"
    t.boolean "is_codeable",   :default => false
  end

  add_index "questions", ["category"], :name => "index_questions_on_category"
  add_index "questions", ["display_order"], :name => "index_questions_on_display_order"
  add_index "questions", ["snapshot_id"], :name => "index_questions_on_snapshot_id"

  create_table "responses", :force => true do |t|
    t.integer "scholar_id"
    t.integer "question_id"
    t.text    "response"
    t.string  "code"
  end

  create_table "schools", :force => true do |t|
    t.string  "name"
    t.boolean "is_active", :default => true
  end

  add_index "schools", ["name"], :name => "index_schools_on_name"

  create_table "snapshots", :force => true do |t|
    t.integer "profile_id"
    t.string  "name"
    t.string  "subtitle"
    t.text    "text"
  end

  add_index "snapshots", ["profile_id"], :name => "index_snapshots_on_profile_id"

  create_table "snapshots_tips", :id => false, :force => true do |t|
    t.integer "snapshot_id"
    t.integer "tip_id"
  end

  add_index "snapshots_tips", ["snapshot_id"], :name => "index_snapshots_tips_on_snapshot_id"
  add_index "snapshots_tips", ["tip_id"], :name => "index_snapshots_tips_on_tip_id"

  create_table "tips", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "school_id"
    t.integer  "klass_id"
    t.string   "username"
    t.string   "password"
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.integer  "grade"
    t.boolean  "is_active",  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["klass_id"], :name => "index_users_on_klass_id"
  add_index "users", ["school_id"], :name => "index_users_on_school_id"
  add_index "users", ["type"], :name => "index_users_on_type"
  add_index "users", ["username"], :name => "index_users_on_username"

end
