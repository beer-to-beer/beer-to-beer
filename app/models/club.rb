class Club < ActiveRecord::Base
  has_many :events
  belongs_to :address
  accepts_nested_attributes_for :address
  #validates :address_id, presence: true
end
