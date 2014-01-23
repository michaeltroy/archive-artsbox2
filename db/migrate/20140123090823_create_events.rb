class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   "title"
      t.string   "location"
      t.string   "venue"
      t.string   "artist"
      t.text     "body"
      t.string   "link"
      t.string   "permalink"
      t.datetime "start_date"
      t.datetime "start_time"
      t.datetime "end_date"
      t.datetime "end_time"
      t.datetime "opening_date"
      t.datetime "opening_time"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "category"
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.integer  "image_file_size"
    end
  end
end
