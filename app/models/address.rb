class Address < ActiveRecord::Base
  has_one :user
  has_one :club
  has_one :shop
  #validates :street,:house_number,:city,:country, presence: true
  #validates :postal_code,presence: true,numericality: true
end
