class AddPostDatesIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_dates_id, :integer
  end
end
