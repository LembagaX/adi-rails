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

ActiveRecord::Schema.define(version: 2019_02_17_142459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address", limit: 120
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "assemblies", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "material_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_assemblies_on_material_id"
    t.index ["product_id"], name: "index_assemblies_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_carts_on_order_id"
    t.index ["product_id"], name: "index_carts_on_product_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 60
    t.string "slug", limit: 60
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "currencies", force: :cascade do |t|
    t.string "code", limit: 3
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
    t.index ["user_id"], name: "index_currencies_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", limit: 45
    t.string "phone", limit: 17
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.index ["address_id"], name: "index_customers_on_address_id"
  end

  create_table "delivery_orders", force: :cascade do |t|
    t.integer "number"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_delivery_orders_on_order_id"
  end

  create_table "depreciations", force: :cascade do |t|
    t.string "note", limit: 255
    t.integer "amount"
    t.integer "quantity"
    t.bigint "provider_id"
    t.bigint "material_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_depreciations_on_material_id"
    t.index ["provider_id"], name: "index_depreciations_on_provider_id"
    t.index ["user_id"], name: "index_depreciations_on_user_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
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

  create_table "invoices", force: :cascade do |t|
    t.string "number", limit: 16
    t.integer "termin", limit: 2
    t.bigint "currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["currency_id"], name: "index_invoices_on_currency_id"
    t.index ["order_id"], name: "index_invoices_on_order_id"
  end

  create_table "manifests", force: :cascade do |t|
    t.bigint "manufacture_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacture_id"], name: "index_manifests_on_manufacture_id"
    t.index ["product_id"], name: "index_manifests_on_product_id"
  end

  create_table "manufactures", force: :cascade do |t|
    t.bigint "user_id"
    t.string "code", limit: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_manufactures_on_code", unique: true
    t.index ["user_id"], name: "index_manufactures_on_user_id"
  end

  create_table "material_purchases", force: :cascade do |t|
    t.bigint "material_id"
    t.bigint "purchase_id"
    t.integer "price"
    t.integer "quantity"
    t.index ["material_id"], name: "index_material_purchases_on_material_id"
    t.index ["purchase_id"], name: "index_material_purchases_on_purchase_id"
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
    t.bigint "material_id"
    t.bigint "provider_id"
    t.index ["material_id"], name: "index_materials_providers_on_material_id"
    t.index ["provider_id"], name: "index_materials_providers_on_provider_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "price"
    t.integer "number"
    t.boolean "canceled"
    t.bigint "user_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "discount", default: 0
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "material_id"
    t.bigint "provider_id"
    t.index ["material_id"], name: "index_prices_on_material_id"
    t.index ["provider_id"], name: "index_prices_on_provider_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "code", limit: 10
    t.string "name", limit: 60
    t.string "serial_number", limit: 15
    t.integer "price"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["code"], name: "index_products_on_code", unique: true
  end

  create_table "providers", force: :cascade do |t|
    t.string "name", limit: 120
    t.string "slug", limit: 120
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_providers_on_slug", unique: true
  end

  create_table "purchases", force: :cascade do |t|
    t.string "invoice", limit: 150
    t.integer "amount"
    t.string "note", limit: 255
    t.datetime "purchased_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "provider_id"
    t.bigint "user_id"
    t.index ["provider_id"], name: "index_purchases_on_provider_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
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
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "assemblies", "materials"
  add_foreign_key "assemblies", "products"
  add_foreign_key "carts", "orders"
  add_foreign_key "carts", "products"
  add_foreign_key "currencies", "users"
  add_foreign_key "customers", "addresses"
  add_foreign_key "delivery_orders", "orders"
  add_foreign_key "depreciations", "materials"
  add_foreign_key "depreciations", "providers"
  add_foreign_key "depreciations", "users"
  add_foreign_key "invoices", "currencies"
  add_foreign_key "invoices", "orders"
  add_foreign_key "manifests", "manufactures"
  add_foreign_key "manifests", "products"
  add_foreign_key "manufactures", "users"
  add_foreign_key "material_purchases", "materials"
  add_foreign_key "material_purchases", "purchases"
  add_foreign_key "materials_providers", "materials"
  add_foreign_key "materials_providers", "providers"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "users"
  add_foreign_key "prices", "materials"
  add_foreign_key "prices", "providers"
  add_foreign_key "products", "categories"
  add_foreign_key "purchases", "providers"
  add_foreign_key "purchases", "users"
  add_foreign_key "users", "roles"
end
