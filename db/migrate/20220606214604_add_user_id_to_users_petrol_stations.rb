class AddUserIdToUsersPetrolStations < ActiveRecord::Migration[7.0]
  def change
    add_column :users_petrol_stations, :user_id, :integer
  end
end
