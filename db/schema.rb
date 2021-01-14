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

ActiveRecord::Schema.define(version: 2021_01_13_141958) do

  create_table "admins", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "defaults", force: :cascade do |t|
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_defaults_on_user_id"
  end

  create_table "exercise_series", force: :cascade do |t|
    t.integer "sets"
    t.integer "reps"
    t.integer "exercise_id"
    t.integer "routine_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_exercise_series_on_exercise_id"
    t.index ["routine_id"], name: "index_exercise_series_on_routine_id"
  end

  create_table "exercise_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.integer "exercise_type_id"
    t.string "name"
    t.string "video_directory"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_type_id"], name: "index_exercises_on_exercise_type_id"
  end

  create_table "links", force: :cascade do |t|
    t.boolean "is_active"
    t.integer "physio_id"
    t.integer "default_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["default_id"], name: "index_links_on_default_id"
    t.index ["physio_id"], name: "index_links_on_physio_id"
  end

  create_table "physios", force: :cascade do |t|
    t.string "crefito"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_physios_on_user_id"
  end

  create_table "routines", force: :cascade do |t|
    t.date "beginning"
    t.date "end"
    t.integer "link_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["link_id"], name: "index_routines_on_link_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.integer "physio_id"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["physio_id"], name: "index_tokens_on_physio_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "exercise_series", "exercises"
end
