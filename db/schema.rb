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

ActiveRecord::Schema[7.0].define(version: 2023_08_24_021126) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.boolean "full_time"
    t.integer "years_involved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "orchestra_id", null: false
    t.index ["orchestra_id"], name: "index_musicians_on_orchestra_id"
  end

  create_table "orchestras", force: :cascade do |t|
    t.string "name"
    t.boolean "auditions_open"
    t.integer "year_established"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "musicians", "orchestras"
end
