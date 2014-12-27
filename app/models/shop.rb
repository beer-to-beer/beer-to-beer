class Shop < ActiveRecord::Base
  belongs_to :address
  #has_one :shop_bier
  accepts_nested_attributes_for :address
  validates :address_id, presence: true
end
