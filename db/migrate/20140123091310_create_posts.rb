class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   "title"
      t.text     "body"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "stream_id"
    end
  end
end
