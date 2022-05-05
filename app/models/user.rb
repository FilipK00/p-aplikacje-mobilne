class User < ApplicationRecord
    has_and_belongs_to_many :petrol_stations, :join_table => :users_petrol_stations
    has_many :post_date
    has_many :posts
    has_secure_password
    has_secure_token
    validates :name, presence: true, uniqueness: true, length: { in: 3..50 }
    validates :index, presence: true, length: { is: 6 }, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    def invalidate_token
      self.update_columns(token: nil)
    end
end
