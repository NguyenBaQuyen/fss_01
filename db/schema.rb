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

ActiveRecord::Schema.define(version: 20170321065932) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "action_type", default: 0, null: false
    t.string   "url",                     null: false
    t.string   "comment"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_group_id"
    t.string   "name",              null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["category_group_id"], name: "index_categories_on_category_group_id", using: :btree
  end

  create_table "categories_recipes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "recipe_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categories_recipes_on_category_id", using: :btree
    t.index ["recipe_id", "category_id"], name: "index_categories_recipes_on_recipe_id_and_category_id", unique: true, using: :btree
    t.index ["recipe_id"], name: "index_categories_recipes_on_recipe_id", using: :btree
  end

  create_table "category_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                          null: false
    t.boolean  "single_select", default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "name",                                  null: false
    t.text     "description", limit: 65535
    t.string   "cover"
    t.integer  "views_count",               default: 0, null: false
    t.integer  "likes_count",               default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["user_id"], name: "index_collections_on_user_id", using: :btree
  end

  create_table "collections_recipes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "recipe_id"
    t.integer "collection_id"
    t.index ["collection_id"], name: "index_collections_recipes_on_collection_id", using: :btree
    t.index ["recipe_id", "collection_id"], name: "index_collections_recipes_on_recipe_id_and_collection_id", unique: true, using: :btree
    t.index ["recipe_id"], name: "index_collections_recipes_on_recipe_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.text     "content",     limit: 65535,             null: false
    t.json     "images"
    t.integer  "likes_count",               default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["recipe_id"], name: "index_comments_on_recipe_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "recipe_id"
    t.string   "name",                  null: false
    t.float    "number",     limit: 24
    t.string   "unit"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["recipe_id"], name: "index_materials_on_recipe_id", using: :btree
  end

  create_table "recipes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description",   limit: 65535
    t.string   "cover"
    t.integer  "duration"
    t.integer  "views_count",                 default: 0,   null: false
    t.integer  "likes_count",                 default: 0,   null: false
    t.integer  "votes_count",                 default: 0,   null: false
    t.float    "votes_average", limit: 24,    default: 0.0, null: false
    t.integer  "status",                      default: 0,   null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["user_id"], name: "index_recipes_on_user_id", using: :btree
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_reports_on_recipe_id", using: :btree
    t.index ["user_id"], name: "index_reports_on_user_id", using: :btree
  end

  create_table "steps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "recipe_id"
    t.text     "content",    limit: 65535, null: false
    t.integer  "order",                    null: false
    t.json     "images"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["recipe_id"], name: "index_steps_on_recipe_id", using: :btree
  end

  create_table "unit_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "locale"
    t.string   "key"
    t.text     "value",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role",                   default: 1,  null: false
    t.string   "name",                                null: false
    t.string   "avatar"
    t.string   "description"
    t.string   "country"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.integer  "vote",       default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["recipe_id"], name: "index_votes_on_recipe_id", using: :btree
    t.index ["user_id", "recipe_id"], name: "index_votes_on_user_id_and_recipe_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

  add_foreign_key "activities", "users"
  add_foreign_key "categories", "category_groups"
  add_foreign_key "categories_recipes", "categories"
  add_foreign_key "categories_recipes", "recipes"
  add_foreign_key "collections", "users"
  add_foreign_key "collections_recipes", "collections"
  add_foreign_key "collections_recipes", "recipes"
  add_foreign_key "comments", "recipes"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "materials", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "reports", "recipes"
  add_foreign_key "reports", "users"
  add_foreign_key "steps", "recipes"
  add_foreign_key "votes", "recipes"
  add_foreign_key "votes", "users"
end
