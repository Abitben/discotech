# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_327_122_644) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'albums', force: :cascade do |t|
    t.string 'release_id'
    t.string 'image_url'
    t.string 'title'
    t.string 'artist'
    t.integer 'year'
    t.decimal 'price', precision: 5, scale: 2
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'cartlines', force: :cascade do |t|
    t.bigint 'collection_id', null: false
    t.bigint 'cart_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['cart_id'], name: 'index_cartlines_on_cart_id'
    t.index ['collection_id'], name: 'index_cartlines_on_collection_id'
  end

  create_table 'carts', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'collections', force: :cascade do |t|
    t.bigint 'album_id', null: false
    t.bigint 'user_id', null: false
    t.integer 'sleeve_condition', default: 0
    t.integer 'media_condition', default: 0
    t.integer 'status', default: 0
    t.integer 'for_sale', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['album_id'], name: 'index_collections_on_album_id'
    t.index ['user_id'], name: 'index_collections_on_user_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'cart_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['cart_id'], name: 'index_orders_on_cart_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.text 'address'
    t.string 'zip_code'
    t.string 'city_name'
    t.string 'country'
    t.string 'phone'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.boolean 'is_admin'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'cartlines', 'carts'
  add_foreign_key 'cartlines', 'collections'
  add_foreign_key 'collections', 'albums'
  add_foreign_key 'collections', 'users'
  add_foreign_key 'orders', 'carts'
  add_foreign_key 'orders', 'users'
end
