class PostDate < ApplicationRecord
  belongs_to :user
  belongs_to :petrol_station
  has_many :posts
end
