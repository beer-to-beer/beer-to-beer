class Club < ActiveRecord::Base
  has_many :beer_clubs
  has_many :beers, through:  :beer_clubs
  has_many :events
  belongs_to :address
  accepts_nested_attributes_for :address, :beers
  #validates :address_id, presence: true

end
