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

ActiveRecord::Schema.define(version: 20180517174845) do

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.text "mission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edit_permissions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "department_id"
    t.integer "post_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_edit_permissions_on_department_id"
    t.index ["post_type_id"], name: "index_edit_permissions_on_post_type_id"
    t.index ["user_id"], name: "index_edit_permissions_on_user_id"
  end

  create_table "gutentag_taggings", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "taggable_id", null: false
    t.string "taggable_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_gutentag_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id", "tag_id"], name: "unique_taggings", unique: true
    t.index ["taggable_type", "taggable_id"], name: "index_gutentag_taggings_on_taggable_type_and_taggable_id"
  end

  create_table "gutentag_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0, null: false
    t.index ["name"], name: "index_gutentag_tags_on_name", unique: true
    t.index ["taggings_count"], name: "index_gutentag_tags_on_taggings_count"
  end

  create_table "post_types", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.text "body"
    t.integer "department_id"
    t.integer "post_type_id"
    t.integer "author_id"
    t.string "video_url"
    t.string "action_url"
    t.datetime "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
    t.index ["department_id"], name: "index_posts_on_department_id"
    t.index ["post_type_id"], name: "index_posts_on_post_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "title"
    t.integer "department_id"
    t.boolean "department_head", default: false
    t.text "bio", default: ""
    t.string "photo_url", default: "https://robohash.org/hendrick"
    t.string "slack_username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "primary_phone"
    t.string "mobile_phone"
    t.string "first_name"
    t.string "last_name"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
