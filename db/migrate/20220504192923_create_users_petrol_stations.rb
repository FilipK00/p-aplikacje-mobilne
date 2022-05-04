class CreateUsersPetrolStations < ActiveRecord::Migration[7.0]
  def change
    create_table :users_petrol_stations do |t|

      t.timestamps
    end
  end
end
