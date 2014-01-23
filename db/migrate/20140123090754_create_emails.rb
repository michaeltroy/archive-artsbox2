class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string   "from"
      t.string   "to"
      t.integer  "last_send_attempt", :default => 0
      t.text     "mail"
      t.datetime "created_on"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
