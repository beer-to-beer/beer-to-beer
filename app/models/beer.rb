class Beer < ActiveRecord::Base
  #belongs_to :category
  #belongs_to :producer
  #has_many :shop_beers
  #has_many :shops, through: :shop_beers
  #belongs_to :price
  validates :title, presence: true
end
