class CreatePostOffices < ActiveRecord::Migration
  def change
    create_table :post_offices do |t|

      t.timestamps
    end
  end
end
