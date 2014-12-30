class Category < ActiveRecord::Base
  has_many :beer_clubs
  has_many :beers, through: :beer_clubs
  validates :name, presence: :true
end
