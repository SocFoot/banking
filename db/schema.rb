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

ActiveRecord::Schema.define(version: 20160213145954) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "zip",          limit: 16
    t.string   "libelle"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.string   "admin"
    t.string   "references"
    t.integer  "admin_id"
    t.integer  "conseille_id"
    t.integer  "fake_id"
  end

  add_index "accounts", ["admin_id"], name: "index_accounts_on_admin_id"
  add_index "accounts", ["conseille_id"], name: "index_accounts_on_conseille_id"
  add_index "accounts", ["fake_id"], name: "index_accounts_on_fake_id"
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "admins", force: :cascade do |t|
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
    t.string   "nom"
    t.string   "prenom"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "conseilles", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "litige"
  end

  create_table "epargne_types", force: :cascade do |t|
    t.string   "nom"
    t.integer  "epargne_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "epargne_types", ["epargne_id"], name: "index_epargne_types_on_epargne_id"

  create_table "epargnes", force: :cascade do |t|
    t.string   "libelle"
    t.decimal  "rate",         precision: 4, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "receive"
    t.integer  "conseille_id"
  end

  add_index "epargnes", ["conseille_id"], name: "index_epargnes_on_conseille_id"
  add_index "epargnes", ["user_id"], name: "index_epargnes_on_user_id"

  create_table "litiges", force: :cascade do |t|
    t.string   "identifiant"
    t.string   "status"
    t.string   "motif"
    t.integer  "transaction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "conseille_id"
  end

  add_index "litiges", ["conseille_id"], name: "index_litiges_on_conseille_id"
  add_index "litiges", ["transaction_id"], name: "index_litiges_on_transaction_id"

  create_table "transactions", force: :cascade do |t|
    t.integer  "in"
    t.integer  "out"
    t.string   "libelle"
    t.integer  "account_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "conseille_id"
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id"
  add_index "transactions", ["conseille_id"], name: "index_transactions_on_conseille_id"

  create_table "users", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "sexe"
    t.string   "adresse"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "password_digest"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "conseille_id"
  end

  add_index "users", ["conseille_id"], name: "index_users_on_conseille_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
