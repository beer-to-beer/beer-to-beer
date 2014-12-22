class Address < ActiveRecord::Base
  has_one :user
 # attr_accessible :city, :postal_code, :street, :house_number, :country
end
