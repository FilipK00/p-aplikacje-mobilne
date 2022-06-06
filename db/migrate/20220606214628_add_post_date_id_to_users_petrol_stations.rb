class AddPostDateIdToUsersPetrolStations < ActiveRecord::Migration[7.0]
  def change
    add_column :users_petrol_stations, :post_date_id, :integer
  end
end
