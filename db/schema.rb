# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_131_200_033) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'locations', force: :cascade do |t|
    t.text 'name'
    t.float 'lat'
    t.float 'lng'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'total_rooms'
    t.index ['name'], name: 'index_locations_on_name', unique: true
  end

  create_table 'photos', force: :cascade do |t|
    t.string 'url'
    t.bigint 'room_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['room_id'], name: 'index_photos_on_room_id'
  end

  create_table 'rooms', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'owner'
    t.decimal 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'location_id'
    t.index ['location_id'], name: 'index_rooms_on_location_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'photos', 'rooms'
  add_foreign_key 'rooms', 'locations'
end
