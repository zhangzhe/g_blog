# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100103091133) do

  create_table "blog_groups", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.string   "type"
    t.text     "content"
    t.integer  "blog_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "u_title"
  end

  add_index "blogs", ["blog_group_id"], :name => "index_blogs_on_blog_group_id"

  create_table "comments", :force => true do |t|
    t.integer  "blog_id"
    t.text     "content"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["blog_id"], :name => "index_comments_on_blog_id"

  create_table "upload_files", :force => true do |t|
    t.integer  "size"
    t.integer  "blog_group_id"
    t.string   "filename"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "upload_files", ["blog_group_id"], :name => "index_upload_files_on_blog_group_id"

end
