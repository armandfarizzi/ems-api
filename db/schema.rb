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

ActiveRecord::Schema[7.0].define(version: 2023_05_25_034138) do
  create_table "department", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "budget", null: false
    t.bigint "created_date", null: false
    t.string "department_name"
    t.string "location"
    t.bigint "modified_date"
  end

  create_table "employee", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "created_date", null: false
    t.string "email"
    t.bigint "modified_date"
    t.string "name"
    t.string "role"
    t.string "department_id"
    t.index ["department_id"], name: "FKbejtwvg9bxus2mffsm3swj3u9"
  end

  create_table "reviews", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "employee_id"
    t.integer "rating"
    t.text "comment"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id", "created_at"], name: "review_employee_id"
  end

  add_foreign_key "employee", "department", name: "FKbejtwvg9bxus2mffsm3swj3u9"
end
