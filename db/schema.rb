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

ActiveRecord::Schema[8.1].define(version: 2026_10_18_191027) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performed_exercises", force: :cascade do |t|
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "workout_id", null: false
    t.integer "position", null: false
    t.index ["exercise_id"], name: "index_performed_exercises_on_exercise_id"
    t.index ["workout_id", "position"], name: "index_performed_exercises_on_workout_id_and_position", unique: true
    t.index ["workout_id"], name: "index_performed_exercises_on_workout_id"
  end

  create_table "performed_sets", force: :cascade do |t|
    t.bigint "performed_exercise_id"
    t.integer "performed_reps"
    t.integer "duration_in_seconds"
    t.float "rpe"
    t.boolean "rest_after", default: true, null: false
    t.datetime "done_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "weight", precision: 8, scale: 4
    t.index ["performed_exercise_id"], name: "index_performed_sets_on_performed_exercise_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "started_at", null: false
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "performed_exercises", "exercises"
  add_foreign_key "performed_exercises", "workouts"
  add_foreign_key "performed_sets", "performed_exercises"
  add_foreign_key "sessions", "users"
end
