class Shop < ActiveRecord::Base
  belongs_to :address
  #has_one :shop_beer
  accepts_nested_attributes_for :address
  validates :address_id, presence: true
end
