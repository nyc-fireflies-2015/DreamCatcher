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

ActiveRecord::Schema.define(version: 20150917202223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dreamers", force: :cascade do |t|
    t.string   "username",        limit: 64,             null: false
    t.string   "password_digest",                        null: false
    t.text     "about"
    t.text     "recipe"
    t.integer  "level",                      default: 0
    t.integer  "zipcode",                                null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email"
  end

  create_table "dreams", force: :cascade do |t|
    t.text     "story",                                  null: false
    t.boolean  "decision_clarity?",      default: false
    t.boolean  "consciousness_clarity?", default: false
    t.boolean  "dream_state_clarity?",   default: false
    t.integer  "lucidity_rating",        default: 0
    t.integer  "dreamer_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "dream_id"
    t.integer  "fan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
