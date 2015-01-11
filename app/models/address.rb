class Address < ActiveRecord::Base
  has_one :user
  has_one :club
  has_one :shop

end
