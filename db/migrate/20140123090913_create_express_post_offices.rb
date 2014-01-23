class CreateExpressPostOffices < ActiveRecord::Migration
  def change
    create_table :express_post_offices do |t|

      t.timestamps
    end
  end
end
