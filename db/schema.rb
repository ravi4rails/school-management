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

ActiveRecord::Schema.define(version: 20160504171852) do

  create_table "batches", force: :cascade do |t|
    t.date     "start_year"
    t.date     "end_year"
    t.boolean  "is_active"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "batches", ["course_id"], name: "index_batches_on_course_id"

  create_table "course_subjects", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id"
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "duration"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "courses", ["department_id"], name: "index_courses_on_department_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "email"
    t.string   "contact"
    t.string   "address"
    t.date     "date_of_birth"
    t.integer  "age"
    t.date     "date_of_joining"
    t.string   "qualification"
    t.integer  "department_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "guardians", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.date     "date_of_birth"
    t.string   "relation"
    t.string   "contact"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "student_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "guardians", ["student_id"], name: "index_guardians_on_student_id"

  create_table "section_subjects", force: :cascade do |t|
    t.integer  "section_id"
    t.integer  "course_subject_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "section_subjects", ["course_subject_id"], name: "index_section_subjects_on_course_subject_id"
  add_index "section_subjects", ["section_id"], name: "index_section_subjects_on_section_id"

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sections", ["course_id"], name: "index_sections_on_course_id"

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "contact"
    t.text     "address"
    t.date     "date_of_birth"
    t.date     "admission_date"
    t.date     "enrollment_date"
    t.string   "admission_number"
    t.string   "enrollment_number"
    t.string   "category"
    t.string   "relegion"
    t.integer  "course_id"
    t.integer  "batch_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "age"
  end

  add_index "students", ["batch_id"], name: "index_students_on_batch_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
