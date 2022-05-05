class CreatePostDates < ActiveRecord::Migration[7.0]
  def change
    create_table :post_dates do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.references :petrol_station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
