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

ActiveRecord::Schema.define(version: 2019_01_13_073911) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name", limit: 120
    t.string "slug", limit: 120
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_materials_on_slug", unique: true
  end

  create_table "materials_providers", id: false, force: :cascade do |t|
    t.integer "material_id"
    t.integer "provider_id"
    t.index ["material_id"], name: "index_materials_providers_on_material_id"
    t.index ["provider_id"], name: "index_materials_providers_on_provider_id"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "material_id"
    t.integer "provider_id"
    t.index ["material_id"], name: "index_prices_on_material_id"
    t.index ["provider_id"], name: "index_prices_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name", limit: 120
    t.string "slug", limit: 120
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_providers_on_slug", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 20
    t.string "display_name", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 45
    t.string "email", limit: 45
    t.string "password_digest", limit: 72
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "secret", limit: 60
    t.integer "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
