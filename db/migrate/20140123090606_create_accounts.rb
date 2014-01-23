class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    t.string   "plan",            :default => "free"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "role",            :default => "user"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "activated"
    t.string   "activation_code", :limit => 40
    t.datetime "activated_at"
    end
  end
end
