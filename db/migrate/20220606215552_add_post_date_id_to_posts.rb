class AddPostDateIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_date_id, :integer
  end
end
