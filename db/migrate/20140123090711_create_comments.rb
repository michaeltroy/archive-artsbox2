class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text     "body"
      t.integer  "post_id"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
