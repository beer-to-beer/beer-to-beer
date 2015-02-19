class Address < ActiveRecord::Base
  has_one :user
  has_one :club
  has_one :shop
  validates :street,:house_number,:city,:country,:postal_code, presence: true
end
