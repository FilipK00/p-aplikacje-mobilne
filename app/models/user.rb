class User < ApplicationRecord
    has_and_belongs_to_many :petrol_stations, :join_table => :users_petrol_stations
    has_many :posts

    validates :name, presence: true, uniqueness: true, length: { in: 3..50 }
    validates :index, presence: true, length: { is: 6 }, uniqueness: true
end
