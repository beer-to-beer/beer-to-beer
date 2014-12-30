class BeerClub < ActiveRecord::Base
  belongs_to :beer
  belongs_to :club
end
