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

ActiveRecord::Schema[7.2].define(version: 2025_08_11_091349) do
  create_table "feedbacks", force: :cascade do |t|
    t.integer "play_session_id", null: false
    t.integer "score", default: 0, null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["play_session_id"], name: "index_feedbacks_on_play_session_id"
  end

  create_table "play_sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "scenario_id", null: false
    t.datetime "started_at", null: false
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scenario_id"], name: "index_play_sessions_on_scenario_id"
    t.index ["user_id", "scenario_id", "started_at"], name: "idx_unique_session_start", unique: true
    t.index ["user_id"], name: "index_play_sessions_on_user_id"
  end

  create_table "scenarios", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "modality", default: "desktop", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modality"], name: "index_scenarios_on_modality"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "feedbacks", "play_sessions"
  add_foreign_key "play_sessions", "scenarios"
  add_foreign_key "play_sessions", "users"
end
