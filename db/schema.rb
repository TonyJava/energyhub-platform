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

ActiveRecord::Schema.define(version: 20170103184408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "contractors", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "email"
    t.string   "phone"
    t.string   "states_serviced",              array: true
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "hubs", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.decimal  "percent_fee"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "participants", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "organization"
    t.string   "title"
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.uuid     "hub_id"
    t.index ["hub_id"], name: "index_participants_on_hub_id", using: :btree
  end

  create_table "projects", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.string   "project_status"
    t.string   "intake_path"
    t.string   "project_type"
    t.decimal  "estimated_annual_production"
    t.decimal  "estimated_annual_savings"
    t.decimal  "total_project_cost",          precision: 12, scale: 2
    t.date     "fee_invoice_sent"
    t.date     "fee_received"
    t.text     "notes"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.uuid     "site_id"
    t.index ["site_id"], name: "index_projects_on_site_id", using: :btree
  end

  create_table "proposals", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.boolean  "accepted?"
    t.string   "proposal_doc"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.uuid     "contractor_id"
    t.uuid     "project_id"
    t.index ["contractor_id"], name: "index_proposals_on_contractor_id", using: :btree
    t.index ["project_id"], name: "index_proposals_on_project_id", using: :btree
  end

  create_table "site_projects", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid     "site_id"
    t.uuid     "project_id"
    t.index ["project_id"], name: "index_site_projects_on_project_id", using: :btree
    t.index ["site_id"], name: "index_site_projects_on_site_id", using: :btree
  end

  create_table "sites", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "property_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.uuid     "participant_id"
    t.index ["participant_id"], name: "index_sites_on_participant_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
