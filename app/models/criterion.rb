class Criterion < ActiveRecord::Base
  belongs_to :rating
  #validates :value ,:inclusion => 1..5
end
