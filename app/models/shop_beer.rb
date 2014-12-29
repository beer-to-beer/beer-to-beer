class ShopBeer < ActiveRecord::Base
  belongs_to :shop
  belongs_to :beer
end
