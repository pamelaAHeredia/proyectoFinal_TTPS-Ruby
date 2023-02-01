# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_01_012225) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date "date", null: false
    t.time "time", null: false
    t.string "motive", null: false
    t.string "status", null: false
    t.string "comment"
    t.bigint "branch_id", null: false
    t.bigint "user_id", null: false
    t.bigint "personnel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id", "date", "time"], name: "index_appointments_on_branch_id_and_date_and_time", unique: true
    t.index ["branch_id"], name: "index_appointments_on_branch_id"
    t.index ["personnel_id"], name: "index_appointments_on_personnel_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "telephone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "locality_id", null: false
    t.index ["locality_id"], name: "index_branches_on_locality_id"
    t.index ["name"], name: "index_branches_on_name", unique: true
  end

  create_table "localities", force: :cascade do |t|
    t.string "name", null: false
    t.string "province", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province", "name"], name: "index_localities_on_province_and_name", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "day", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.bigint "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id", "day"], name: "index_schedules_on_branch_id_and_day", unique: true
    t.index ["branch_id"], name: "index_schedules_on_branch_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_id"
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "appointments", "branches"
  add_foreign_key "appointments", "users"
  add_foreign_key "appointments", "users", column: "personnel_id"
  add_foreign_key "branches", "localities"
  add_foreign_key "schedules", "branches"
  add_foreign_key "users", "branches"
end
