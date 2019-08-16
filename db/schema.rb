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

ActiveRecord::Schema.define(version: 2019_08_16_103316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "slack_user_profiles", force: :cascade do |t|
    t.string "avatar_hash"
    t.string "status_text"
    t.string "status_emoji"
    t.datetime "status_expiration"
    t.string "real_name"
    t.string "display_name"
    t.string "real_name_normalized"
    t.string "display_name_normalized"
    t.string "email"
    t.string "image_original"
    t.string "team"
    t.bigint "slack_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slack_user_id"], name: "index_slack_user_profiles_on_slack_user_id"
  end

  create_table "slack_users", force: :cascade do |t|
    t.string "slack_user_id"
    t.string "team_id"
    t.string "name"
    t.string "real_name"
    t.string "color"
    t.string "tz"
    t.string "tz_label"
    t.integer "tz_offset"
    t.boolean "is_admin"
    t.boolean "is_owner"
    t.boolean "is_primary_owner"
    t.boolean "is_restricted"
    t.boolean "is_ultra_restricted"
    t.boolean "is_bot"
    t.boolean "is_stranger"
    t.datetime "updated"
    t.boolean "is_app_user"
    t.boolean "has_2fa"
    t.string "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "slack_user_profile_id"
    t.index ["slack_user_profile_id"], name: "index_slack_users_on_slack_user_profile_id"
  end

  add_foreign_key "slack_user_profiles", "slack_users"
end
