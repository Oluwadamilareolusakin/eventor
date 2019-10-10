# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_10_151641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "attendee_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attendee_id", "event_id"], name: "index_attendances_on_attendee_id_and_event_id", unique: true
    t.index ["attendee_id"], name: "index_attendances_on_attendee_id"
    t.index ["event_id"], name: "index_attendances_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.date "date", null: false
    t.time "time", null: false
    t.string "location"
    t.index ["date"], name: "index_events_on_date"
    t.index ["time"], name: "index_events_on_time"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "invitings", force: :cascade do |t|
    t.integer "invited_id"
    t.integer "inviter_id"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id", "inviter_id", "invited_id"], name: "index_invitings_on_event_id_and_inviter_id_and_invited_id", unique: true
    t.index ["event_id"], name: "index_invitings_on_event_id"
    t.index ["invited_id"], name: "index_invitings_on_invited_id"
    t.index ["inviter_id"], name: "index_invitings_on_inviter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "session_digest"
    t.string "username", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_digest"
    t.datetime "session_created_at"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "users"
end
