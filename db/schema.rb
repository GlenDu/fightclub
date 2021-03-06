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

ActiveRecord::Schema.define(version: 2021_12_27_110039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.integer "sum_bet"
    t.bigint "user_combat_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_combat_id"], name: "index_bets_on_user_combat_id"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "combats", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "winer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comptes", force: :cascade do |t|
    t.integer "credits", default: 0
    t.integer "niveau"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comptes_on_user_id"
  end

  create_table "user_combats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "combat_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["combat_id"], name: "index_user_combats_on_combat_id"
    t.index ["user_id"], name: "index_user_combats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "pseudo"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.boolean "account_active", default: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bets", "user_combats"
  add_foreign_key "bets", "users"
  add_foreign_key "comptes", "users"
  add_foreign_key "user_combats", "combats"
  add_foreign_key "user_combats", "users"
end
