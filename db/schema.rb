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

ActiveRecord::Schema.define(version: 20170619212444) do

  create_table "applies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

  create_table "availible_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "day"
    t.integer  "teacher_id"
    t.time     "start_at"
    t.time     "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_availible_times_on_teacher_id", using: :btree
  end

  create_table "colleges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "desc",              limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "course_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.integer  "count"
    t.integer  "count_per_week"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "teacher_id"
    t.integer  "total_lessions", default: 0
    t.date     "start_date"
    t.index ["course_id"], name: "index_course_students_on_course_id", using: :btree
    t.index ["student_id"], name: "index_course_students_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_course_students_on_teacher_id", using: :btree
  end

  create_table "course_teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_teachers_on_course_id", using: :btree
    t.index ["teacher_id"], name: "index_course_teachers_on_teacher_id", using: :btree
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "length"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.date     "start_at"
    t.date     "end_at"
    t.integer  "lession_count"
  end

  create_table "lession_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "course_student_id"
    t.string   "day"
    t.time     "start_at"
    t.time     "end_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.index ["course_id"], name: "index_lession_times_on_course_id", using: :btree
    t.index ["course_student_id"], name: "index_lession_times_on_course_student_id", using: :btree
    t.index ["student_id"], name: "index_lession_times_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_lession_times_on_teacher_id", using: :btree
  end

  create_table "lessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "start_at"
    t.integer  "status"
    t.string   "url"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.datetime "end_at"
    t.integer  "day"
    t.string   "meetingkey"
    t.text     "join_url",            limit: 65535
    t.text     "host_url",            limit: 65535
    t.string   "meeting_password"
    t.integer  "customer_service_id"
    t.index ["course_id"], name: "index_lessions_on_course_id", using: :btree
    t.index ["customer_service_id"], name: "index_lessions_on_customer_service_id", using: :btree
    t.index ["start_at"], name: "index_lessions_on_start_at", using: :btree
    t.index ["student_id"], name: "index_lessions_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_lessions_on_teacher_id", using: :btree
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "content",            limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "url"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email",                  default: "",    null: false
    t.string   "phone"
    t.integer  "age"
    t.boolean  "gender"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "user_type",              default: 0
    t.string   "type"
    t.string   "school"
    t.integer  "grade"
    t.string   "school_type"
    t.string   "time_zone"
    t.integer  "customer_service_id"
    t.boolean  "status",                 default: false
    t.string   "init_password"
    t.index ["customer_service_id"], name: "index_users_on_customer_service_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
