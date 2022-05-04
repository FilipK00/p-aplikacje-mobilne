class PetrolStation < ApplicationRecord
    has_and_belongs_to_many :users, :join_table => :petrol_stations_users
    has_many :posts
end
