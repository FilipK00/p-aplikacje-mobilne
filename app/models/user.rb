class User < ApplicationRecord
    has_and_belongs_to_many :petrol_stations, :join_table => :users_petrol_stations
    has_many :posts
end
