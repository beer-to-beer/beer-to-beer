class Club < ActiveRecord::Base
  has_many :beer_clubs
  has_many :beers, through:  :beer_clubs
  has_many :events
  belongs_to :address
  belongs_to :user
  accepts_nested_attributes_for :address, :beers, :user
  mount_uploader :clubURL, ImageUploader

end
