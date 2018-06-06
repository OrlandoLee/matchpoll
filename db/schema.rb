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

ActiveRecord::Schema.define(version: 2018_06_05_070701) do

  create_table "hiring_companies", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "source"
    t.string "name"
    t.text "snippet"
    t.string "category"
    t.string "posted_time"
    t.string "posted_time_friendly"
    t.string "url"
    t.string "location"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "salary_source"
    t.string "salary_interval"
    t.integer "salary_max"
    t.integer "salary_max_annual"
    t.integer "salary_min"
    t.string "industry_name"
    t.integer "hiring_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hiring_company_id"], name: "index_jobs_on_hiring_company_id"
  end

end
