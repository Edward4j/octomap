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

ActiveRecord::Schema.define(version: 20150106013248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "fields", force: true do |t|
    t.string   "name"
    t.spatial  "shape1",       limit: {:srid=>4326, :type=>"multi_polygon", :geographic=>true}
    t.spatial  "lonlat",       limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.spatial  "lonlatheight", limit: {:srid=>4326, :type=>"point", :has_z=>true, :geographic=>true}
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "shape2",       limit: {:srid=>0, :type=>"geometry"}
    t.spatial  "shape3",       limit: {:srid=>0, :type=>"geometry"}
    t.spatial  "path",         limit: {:srid=>3785, :type=>"line_string"}
  end

end
