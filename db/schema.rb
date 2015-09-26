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

ActiveRecord::Schema.define(version: 20150925083159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favs", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "money"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "investment_id"
  end

  add_index "favs", ["investment_id"], name: "index_favs_on_investment_id", using: :btree

  create_table "feeds", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "link",       limit: 255
    t.string   "feed",       limit: 255
    t.integer  "planet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feeds", ["planet_id"], name: "index_feeds_on_planet_id", using: :btree

  create_table "investments", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "investments", ["user_id"], name: "index_investments_on_user_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.text     "text"
    t.text     "point"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "planets", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain",  limit: 255
    t.string   "template",   limit: 255
  end

  create_table "polyclinics", force: :cascade do |t|
    t.text     "name"
    t.integer  "symptom_id"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "polyclinics", ["patient_id"], name: "index_polyclinics_on_patient_id", using: :btree
  add_index "polyclinics", ["symptom_id"], name: "index_polyclinics_on_symptom_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "code"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "name"
    t.integer  "symptom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["symptom_id"], name: "index_questions_on_symptom_id", using: :btree

  create_table "search_suggestions", force: :cascade do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "pin"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "favs", "investments"
  add_foreign_key "investments", "users"
  add_foreign_key "options", "questions"
  add_foreign_key "polyclinics", "symptoms"
  add_foreign_key "questions", "symptoms"
end
