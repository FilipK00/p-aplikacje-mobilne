class AddIndexToUsersIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :index, unique: true
  end
end
