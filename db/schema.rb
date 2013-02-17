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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130216201935) do

  create_table "dashboards", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.text     "url"
    t.string   "status"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "search_id"
  end

  create_table "photos_tags", :id => false, :force => true do |t|
    t.integer "photo_id"
    t.integer "tag_id"
  end

  create_table "searches", :force => true do |t|
    t.string   "text"
    t.integer  "num_likes"
    t.integer  "num_dislikes"
    t.integer  "num_neutral"
    t.integer  "num_photos_viewed"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "text"
    t.integer  "count"
    t.integer  "num_likes",    :default => 0
    t.integer  "num_dislikes", :default => 0
    t.integer  "num_neutral"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
