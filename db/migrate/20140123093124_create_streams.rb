class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.integer  "user_id"
      t.string   "action"
      t.integer  "post_id"
      t.integer  "comment_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "name"
      t.integer  "streamer_id"
      t.string   "streamer_type"
    end
  end
end
