class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.float :pb_price
      t.float :diesel_price
      t.references :user, null: false, foreign_key: true
      t.references :petrol_station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
