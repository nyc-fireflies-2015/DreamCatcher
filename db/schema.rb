
ActiveRecord::Schema.define(version: 20150920155141) do

  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content",    null: false
    t.integer  "dreamer_id"
    t.integer  "dream_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dreamers", force: :cascade do |t|
    t.string   "username",        limit: 64,               null: false
    t.string   "password_digest",                          null: false
    t.text     "about"
    t.integer  "level",                        default: 0
    t.integer  "zipcode",                                  null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "email"
    t.string   "avatar_url",      limit: 2048
    t.string   "country",         limit: 2
    t.string   "state",           limit: 2
    t.string   "gender",          limit: 16
  end

  create_table "dreams", force: :cascade do |t|
    t.text     "story",                                              null: false
    t.boolean  "decision_clarity?",                  default: false
    t.boolean  "consciousness_clarity?",             default: false
    t.boolean  "dream_state_clarity?",               default: false
    t.integer  "lucidity_rating",                    default: 0
    t.integer  "dreamer_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "title",                  limit: 128
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "dream_id"
    t.integer  "fan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name",       limit: 512, null: false
    t.integer  "creator_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "recipes_steps", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string   "description",   limit: 2048,                 null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "default",                    default: false
    t.integer  "creator_id"
    t.integer  "recipes_count",              default: 0
  end

end
