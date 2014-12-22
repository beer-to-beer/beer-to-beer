class Address < ActiveRecord::Base
  has_one :user
  has_one :club
 # attr_accessible :city, :postal_code, :street, :house_number, :country
end
