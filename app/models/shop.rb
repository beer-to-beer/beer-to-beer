class Shop < ActiveRecord::Base
  belongs_to :address
  has_many :shop_beers
  has_many :beers, through: :shop_beers
  accepts_nested_attributes_for :address
end