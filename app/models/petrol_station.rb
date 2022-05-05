class PetrolStation < ApplicationRecord
    has_and_belongs_to_many :users, :join_table => :users_petrol_stations
    has_many :post_date
end
