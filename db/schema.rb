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

ActiveRecord::Schema.define(version: 20160109035906) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "zip",        limit: 16
    t.string   "libelle"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "conseilles", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.integer  "user_id"
    t.integer  "account_id"
    t.integer  "transaction_id"
    t.integer  "litige_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "conseilles", ["account_id"], name: "index_conseilles_on_account_id"
  add_index "conseilles", ["litige_id"], name: "index_conseilles_on_litige_id"
  add_index "conseilles", ["transaction_id"], name: "index_conseilles_on_transaction_id"
  add_index "conseilles", ["user_id"], name: "index_conseilles_on_user_id"

  create_table "epargne_types", force: :cascade do |t|
    t.string   "nom"
    t.integer  "epargne_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "epargne_types", ["epargne_id"], name: "index_epargne_types_on_epargne_id"

  create_table "epargnes", force: :cascade do |t|
    t.string   "libelle"
    t.decimal  "rate",       precision: 4, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "receive"
  end

  add_index "epargnes", ["user_id"], name: "index_epargnes_on_user_id"

  create_table "litiges", force: :cascade do |t|
    t.string   "identifiant"
    t.string   "status"
    t.string   "motif"
    t.integer  "transaction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "litiges", ["transaction_id"], name: "index_litiges_on_transaction_id"

  create_table "transactions", force: :cascade do |t|
    t.integer  "in"
    t.integer  "out"
    t.string   "libelle"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id"

  create_table "users", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "sexe"
    t.string   "adresse"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
