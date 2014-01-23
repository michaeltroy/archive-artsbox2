class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "user_id"
      t.string   "background_file_name"
      t.string   "background_content_type"
      t.integer  "background_file_size"
      t.string   "something"
      t.string   "content_background",      :default => "#FFF"
      t.string   "side_panel_background",   :default => "#FFF"
      t.string   "left_panel_background",   :default => "#FFF"
      t.string   "p",                       :default => "#000"
      t.string   "h1",                      :default => "#666"
      t.string   "h2",                      :default => "#999"
      t.string   "h3",                      :default => "#CCC"
      t.string   "a",                       :default => "#333"
      t.string   "background_color",        :default => "#EAEAEA"
      t.string   "page_color",              :default => "#FFFFFF"
    end
  end
end
