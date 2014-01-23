class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "username"
      t.string   "permalink"
      t.text     "description"
      t.string   "avatar_file_name"
      t.string   "avatar_content_type"
      t.integer  "avatar_file_size"
      t.integer  "account_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "role",                :default => "user"
      t.string   "password_hash"
      t.string   "password_salt"
      t.string   "activation_code"
      t.datetime "activated_at"
      t.string   "email"
      t.string   "persona",             :default => "creative"
      t.string   "blank",               :default => ""
    end
  end
end
