class Shop < ActiveRecord::Base

  has_many :shop_beers
  has_many :beers, through: :shop_beers
  belongs_to :address
  accepts_nested_attributes_for :address
end