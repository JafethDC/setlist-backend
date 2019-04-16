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

ActiveRecord::Schema.define(version: 2019_03_21_193534) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'artist_aliases', force: :cascade do |t|
    t.bigint 'artist_id'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['artist_id'], name: 'index_artist_aliases_on_artist_id'
  end

  create_table 'artist_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'artists', force: :cascade do |t|
    t.bigint 'artist_type_id'
    t.string 'mb_gid'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'setlists_count', default: 0
    t.index ['artist_type_id'], name: 'index_artists_on_artist_type_id'
  end

  create_table 'attendances', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'setlist_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['setlist_id'], name: 'index_attendances_on_setlist_id'
    t.index ['user_id'], name: 'index_attendances_on_user_id'
  end

  create_table 'cities', force: :cascade do |t|
    t.string 'name'
    t.float 'lat'
    t.float 'lng'
    t.bigint 'country_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['country_id'], name: 'index_cities_on_country_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'body'
    t.bigint 'user_id'
    t.string 'commentable_type'
    t.bigint 'commentable_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[commentable_type commentable_id], name: 'index_comments_on_commentable_type_and_commentable_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'countries', force: :cascade do |t|
    t.string 'code'
    t.string 'name'
    t.float 'lat'
    t.float 'lng'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'festivals', force: :cascade do |t|
    t.string 'name'
    t.string 'full_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'media', force: :cascade do |t|
    t.bigint 'release_id'
    t.integer 'position'
    t.integer 'mb_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['release_id'], name: 'index_media_on_release_id'
  end

  create_table 'releases', force: :cascade do |t|
    t.string 'name'
    t.bigint 'artist_id'
    t.string 'mb_gid'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['artist_id'], name: 'index_releases_on_artist_id'
  end

  create_table 'setlist_items', force: :cascade do |t|
    t.bigint 'setlist_id'
    t.integer 'type'
    t.bigint 'track_id'
    t.string 'info'
    t.boolean 'is_cover'
    t.bigint 'featuring_artist_id'
    t.integer 'position'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['featuring_artist_id'], name: 'index_setlist_items_on_featuring_artist_id'
    t.index ['setlist_id'], name: 'index_setlist_items_on_setlist_id'
    t.index ['track_id'], name: 'index_setlist_items_on_track_id'
  end

  create_table 'setlists', force: :cascade do |t|
    t.bigint 'artist_id'
    t.bigint 'tour_id'
    t.bigint 'festival_id'
    t.bigint 'venue_id'
    t.date 'date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'attendances_count', default: 0
    t.index ['artist_id'], name: 'index_setlists_on_artist_id'
    t.index ['festival_id'], name: 'index_setlists_on_festival_id'
    t.index ['tour_id'], name: 'index_setlists_on_tour_id'
    t.index ['venue_id'], name: 'index_setlists_on_venue_id'
  end

  create_table 'tours', force: :cascade do |t|
    t.bigint 'artist_id'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['artist_id'], name: 'index_tours_on_artist_id'
  end

  create_table 'tracks', force: :cascade do |t|
    t.bigint 'medium_id'
    t.string 'mb_gid'
    t.string 'name'
    t.integer 'position'
    t.integer 'length'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['medium_id'], name: 'index_tracks_on_medium_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.string 'reset_token'
    t.datetime 'reset_token_expiry'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['username'], name: 'index_users_on_username', unique: true
  end

  create_table 'venues', force: :cascade do |t|
    t.string 'name'
    t.string 'address'
    t.bigint 'city_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['city_id'], name: 'index_venues_on_city_id'
  end

  add_foreign_key 'artist_aliases', 'artists'
  add_foreign_key 'artists', 'artist_types'
  add_foreign_key 'attendances', 'setlists'
  add_foreign_key 'attendances', 'users'
  add_foreign_key 'cities', 'countries'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'media', 'releases'
  add_foreign_key 'releases', 'artists'
  add_foreign_key 'setlist_items', 'artists', column: 'featuring_artist_id'
  add_foreign_key 'setlist_items', 'setlists'
  add_foreign_key 'setlist_items', 'tracks'
  add_foreign_key 'setlists', 'artists'
  add_foreign_key 'setlists', 'festivals'
  add_foreign_key 'setlists', 'tours'
  add_foreign_key 'setlists', 'venues'
  add_foreign_key 'tours', 'artists'
  add_foreign_key 'tracks', 'media'
  add_foreign_key 'venues', 'cities'
end
